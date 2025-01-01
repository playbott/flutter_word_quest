// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/datasources/prefs/shared_preferences.dart';

final directories = ['lib/i18n'];
final supportedLocales = [
  // const Locale('tr', 'TR'),
  const Locale('en', 'US'),
  const Locale('ru', 'RU'),
];

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {

  LocalizationBloc()
      : super(LocalizationState(
            locale: Locale(Prefs.getString('lancode') ??
                supportedLocales[0].languageCode))) {
    on<LocalizationEventLoad>((event, emit) async {
      Locale currentLocale = Locale(
          Prefs.getString('lancode') ?? supportedLocales[0].languageCode);
      bool saved = await Prefs.setString(
          'lancode', (event.locale ?? currentLocale).languageCode);
      emit(LocalizationState(locale: event.locale ?? currentLocale));
    });
  }
}

final class LocalizationEventLoad extends LocalizationEvent {
  LocalizationEventLoad(this.locale);

  final Locale? locale;
}

final class LocalizationEvent {}

final class LocalizationState {
  LocalizationState({required this.locale});

  final Locale locale;
}
