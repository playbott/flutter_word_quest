import 'package:logman/logman.dart';

void info(String message) {
  
  Logman.instance.info(message);
}

void error(Object error, {StackTrace? stackTrace}) {
  Logman.instance.error(error, stackTrace: stackTrace);
}
