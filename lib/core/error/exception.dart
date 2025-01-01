import 'package:localization/localization.dart';

class ServerException implements Exception {
  final String message = 'errorServer'.i18n();

  @override
  String toString() {
    return message;
  }
}

class AuthException implements Exception {
  final String message = 'errorAuth'.i18n();

  @override
  String toString() {
    return message;
  }
}

class RequestException implements Exception {
  final String message = 'errorApp'.i18n();

  @override
  String toString() {
    return message;
  }
}

class ConnectionException implements Exception {
  String message = 'errorConnection'.i18n();

  @override
  String toString() {
    return message;
  }
}

class ConnectionCanceled implements Exception {
  final String message = 'errorConnection'.i18n();

  @override
  String toString() {
    return message;
  }
}

class SharedPrefsException implements Exception {
  final String message = 'errorApp'.i18n();

  @override
  String toString() {
    return message;
  }
}

class ApplicationException implements Exception {
  ApplicationException({required this.details}) : super();
  final String message = 'errorApp'.i18n();
  final String details;

  @override
  String toString() {
    return message;
  }
}
