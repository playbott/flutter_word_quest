import 'dart:io';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cword/ui/theme/dark_theme.dart';
import 'package:cword/ui/theme/light_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_manager/window_manager.dart';
import 'bloc/providers.dart';
import 'core/consts.dart';
import 'data/datasources/prefs/shared_preferences.dart';
import 'global.dart';
import 'presentation/router/router.dart';

Future<void> appInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();

  sqfliteFfiInit();

  await Prefs.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  if (false) {
    await windowManager.ensureInitialized();
    await windowManager.setPosition(const Offset(1475, 0));
    await windowManager.setSize(const Size(452, 1039));
    // print('${await windowManager.getPosition()}');
    // print('${await windowManager.getSize()}');

    WindowOptions windowOptions = const WindowOptions(
      minimumSize: Size(342, 760),
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  await AppLogService.init();
}

void main() async {
  await appInitialization();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: MultiBlocProvider(
              providers: blocProviders,
              child: ThemeProvider(
                  initTheme: (Prefs.getBool(isDarkModeEnabledKey) ?? false)
                      ? DarkThemeConst.darkTheme
                      : LightThemeConst.lightTheme,
                  builder: (context, myTheme) {
                    /*SystemChrome.setEnabledSystemUIMode(
                      SystemUiMode.manual,
                      overlays: [
                        SystemUiOverlay.top,
                        SystemUiOverlay.bottom,
                      ],
                    );*/
                    return BlocBuilder<LocalizationBloc, LocalizationState>(
                        bloc: localizationBloc,
                        builder: (context, localeState) {
                          return MaterialApp.router(
                            title: 'appTitle'.i18n(),
                            debugShowCheckedModeBanner: false,
                            theme: myTheme,
                            darkTheme: DarkThemeConst.darkTheme,
                            themeMode: myTheme.brightness == Brightness.dark
                                ? ThemeMode.dark
                                : ThemeMode.light,
                            locale: localeState.locale,
                            routerConfig: goRouter,
                            localizationsDelegates: [
                              GlobalMaterialLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                              GlobalCupertinoLocalizations.delegate,
                              LocalJsonLocalization.delegate,
                            ],
                            supportedLocales: supportedLocales,
                          );
                        });
                  }),
            ),
          );
        });
  }
}

