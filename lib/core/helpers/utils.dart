// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:cword/global.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

void dd(dynamic message, [int lineSize = 80]) {
  if (kDebugMode) {
    String _message = message.toString();
    int textSize = _message.length;
    int loops = (textSize / lineSize).ceil();
    int pos = 0;
    for (int i = 0; i < loops; i++) {
      if (i == loops - 1) {
        lineSize = textSize - pos;
      }
      print(_message.substring(pos, pos + lineSize));
      pos += lineSize;
    }
  }
}

void pp(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}

bool validUrl(String? url) {
  return url != null && url.isNotEmpty && url.startsWith('https://');
}
