import 'package:cword/bloc/providers.dart';

String tr(String tmLabel, String enLabel, String ruLabel) {
  switch (localizationBloc.state.locale.languageCode) {
    case 'ru':
      return ruLabel;
    case 'en':
      return tmLabel;
    default:
      return tmLabel;
  }
}

String lang(String code) {
  return {
        "en": "English",
        "ru": "Русский",
      }[code] ??
      '';
}
