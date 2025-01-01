export 'data/crossword_build/crossword_build.dart';
import 'data/crossword_save/crossword_save_bloc.dart';
export 'data/app/global_msg_bloc/global_msg_bloc.dart';
export 'data/app/localization/localization_bloc.dart';
export 'data/app/theme/theme_bloc.dart';
import 'providers.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:toastification/toastification.dart';
export 'utils/location_bloc.dart';
export 'utils/router_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider(lazy: false, create: (_) => crosswordBuildBloc),
  BlocProvider(lazy: false, create: (_) => levelSaveBloc),
  BlocProvider(lazy: false, create: (_) => clientLocationBloc),
  BlocProvider(lazy: false, create: (_) => globalMessageBloc),
  BlocProvider(lazy: false, create: (_) => routerBloc),
  BlocProvider(lazy: false, create: (_) => themeBloc..add(ThemeModeGet())),
];

LevelSaveBloc levelSaveBloc = LevelSaveBloc();
CrosswordBuildBloc crosswordBuildBloc = CrosswordBuildBloc();
ClientLocationBloc clientLocationBloc = ClientLocationBloc();
GlobalMessageBloc globalMessageBloc = GlobalMessageBloc();
LocalizationBloc localizationBloc = LocalizationBloc();
RouterBloc routerBloc = RouterBloc();
ThemeBloc themeBloc = ThemeBloc();
