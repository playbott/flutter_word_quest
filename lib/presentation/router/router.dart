import 'package:cword/bloc/providers.dart';
import 'package:cword/main.dart';
import 'package:cword/presentation/generator_screen/generator_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: implementation_imports
import 'package:shared_preferences_explorer/src/shared_preferences_explorer_screen.dart';

// ignore: implementation_imports
import 'package:shared_preferences_explorer/src/filter.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

final heroAnimationController = MaterialApp.createMaterialHeroController();
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: false,
  initialLocation: '/',
  // navigatorKey: _rootNavigatorKey,
/*
  observers: [
    MainAppRouterObserver(),
    // heroAnimationController,
    // LogmanNavigatorObserver()
  ],
*/
  routes: <RouteBase>[
/*    TransitionGoRoute(
        path: '/sign-in',
        builder: (context, state) {
          return const SignInScreen();
        },
        routes: []),*/
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return GeneratorScreen();
        },
        routes: [
          TransitionGoRoute(
              path: '/main-menu',
              builder: (context, state) {
                return GeneratorScreen();
              },
              routes: const []),
        ]),
  ],
);

SlideTransition makeSlideTransition(
    TransitionType type, Animation<double> animation, Widget child) {
  final Tween<Offset> tween;

  switch (type) {
    case TransitionType.slideLeftToRight:
      tween = Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      );
      break;
    case TransitionType.slideUp:
      tween = Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      );
      break;
    case TransitionType.slideRightToLeft:
      tween = Tween<Offset>(
        end: const Offset(1.0, 0.0),
        begin: Offset.zero,
      );
  }

  return SlideTransition(
    position: tween.animate(
      CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn,
      ),
    ),
    child: HeroControllerScope(
      controller: heroAnimationController,
      child: child,
    ),
  );
}

class TransitionGoRoute extends GoRoute {
  TransitionGoRoute({
    super.routes,
    super.builder,
    super.parentNavigatorKey,
    this.barrierDismissible = false,
    this.fullscreenDialog = false,
    this.allowSnapshotting = true,
    this.transitionType = TransitionType.slideLeftToRight,
    required super.path,
  }) : super(pageBuilder: (context, state) {
          routerBloc.add(RouterEvent(state.fullPath ?? ''));

          return SwipeablePage(
            key: state.pageKey,
            allowSnapshotting: allowSnapshotting,
            // canOnlySwipeFromEdge: true,
            fullscreenDialog: fullscreenDialog,
            // child: builder!(context, state),
            transitionDuration: const Duration(milliseconds: 300),
            // key: state.pageKey,
            // barrierDismissible: barrierDismissible,
            transitionBuilder: (context, animation, secondaryAnimation,
                isSwipeGesture, child) {
              return transitionType == null
                  ? FadeTransition(
                      opacity:
                          CurveTween(curve: Curves.easeIn).animate(animation),
                      child: child,
                    )
                  : makeSlideTransition(transitionType, animation, child);
            },
            builder: (BuildContext context) {
              return builder!(context, state);
            },
          );
        });

  final TransitionType? transitionType;
  final bool barrierDismissible;
  final bool fullscreenDialog;
  final bool allowSnapshotting;
}

enum TransitionType {
  slideLeftToRight,
  slideRightToLeft,
  slideUp,
}
