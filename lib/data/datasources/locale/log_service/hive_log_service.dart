import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive_log_storage.dart';

class AppLogService {
  static final AppLogService _instance = AppLogService._internal();

  AppLogService._internal();

  factory AppLogService() {
    return _instance;
  }

  static Box<AppLog>? _logBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AppLogAdapter());
    Hive.registerAdapter(AppLogTypeAdapter());

    _logBox = await Hive.openBox<AppLog>('logs');
  }

  static Future<void> addLog(
    String message, {
    AppLogType type = AppLogType.info,
  }) async {
    if (_logBox == null) {
      throw Exception('LogService is not initialized. Call init() first.');
    }

    final log = AppLog(DateTime.now(), message, type: type);
    await _logBox!.add(log);
  }

  static List<AppLog> getAllLogs() {
    if (_logBox == null) {
      throw Exception('LogService is not initialized. Call init() first.');
    }

    return _logBox!.values.toList();
  }

  static Future<void> clearLogs() async {
    if (_logBox == null) {
      throw Exception('LogService is not initialized. Call init() first.');
    }

    await _logBox!.clear();
  }

  static List<AppLog> getLogs({required int startIndex, required int limit}) {
    if (_logBox == null) {
      throw Exception('LogService is not initialized. Call init() first.');
    }

    final logs = _logBox!.values.toList().reversed.toList();

    final endIndex =
    (startIndex + limit < logs.length) ? startIndex + limit : logs.length;

    late List<AppLog> logsToReturn = [];
    try {
      logsToReturn = logs.sublist(startIndex, endIndex);
    } catch (e) {
      print(e);
      return [];
    }
    return logsToReturn;
  }

  static List<AppLog> getLogs2({required int startIndex, required int limit}) {
    if (_logBox == null) {
      throw Exception('LogService is not initialized. Call init() first.');
    }

    final logs = _logBox!.values.toList();
    final endIndex =
        (startIndex + limit < logs.length) ? startIndex + limit : logs.length;

    late List<AppLog> logsToReturn = [];
    try {
      logsToReturn = logs.sublist(startIndex, endIndex);
    } catch (e) {
      print(e);
      return [];
    }
    return logs.sublist(startIndex, endIndex);
  }

  static Future<void> close() async {
    await Hive.close();
  }
}
