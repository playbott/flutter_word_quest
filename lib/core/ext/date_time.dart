// ignore_for_file: depend_on_referenced_packages

import 'package:cword/bloc/data/app/global_msg_bloc/global_msg_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

String timeFormatRu(time) {
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}

extension DateTimeExtension on DateTime {
  int get lastDayOfMonth => DateTime(year, month + 1, 0).day;

  ///Format date time: dd.MM.yyyy HH:mm
  String get formatRuDateTime {
    String? locale;
    String pattern = 'dd.MM.yyyy HH:mm';
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  ///Format date time: dd.MM.yyyy HH:mm
  String get formatLog {
    String? locale;
    String pattern = 'yyyy-MM-dd HH:mm:ss';
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  ///Format date time: dd.MM.yyyy
  String get formatRuDate {
    String? locale;
    String pattern = 'dd.MM.yyyy';
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  ///Format date time: dd.MM.yyyy
  String get formatTimeHM {
    String? locale;
    String pattern = 'HH:mm';
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  ///Format date: yyyy-MM-dd
  String get formatYMD {
    String? locale;
    String pattern = 'yyyy-MM-dd';
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String format({required String pattern}) {
    String? locale;
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

String oneHourPeriodStr(int hour) {
  return '${'${hour.toString().padLeft(2, '0')}:00'} - ${'${(hour + 1).toString().padLeft(2, '0')}:00'}';
}

class Week {
  int day;
  String shortName;
  String name;

  // String name;
  Week({required this.day, required this.shortName, required this.name});
}

class Month {
  int month;
  String name;
  String shortName;

  // String name;
  Month({required this.month, required this.shortName, required this.name});
}

final tmCurrencyFormat = NumberFormat("#,##0.00", "ru_RU");

String moneyFormat(double price) {
  String value = price.toString();
  if (value.length > 2) {
    value = value.replaceAll(RegExp(r'\D'), '');
    value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ');
  }
  return value;
}

String moneyFormatInt(int price) {
  String value = price.toString();
  if (value.length > 2) {
    value = value.replaceAll(RegExp(r'\D'), '');
    value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ');
  }
  return value;
}

String dateFormat(DateTime dateTime) {
  return "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
}

String moneyTmFormat(double price) {
  return tmCurrencyFormat.format(price);
}

String monthNames(int month) {
  return [
    'monthJan'.i18n(),
    'monthFeb'.i18n(),
    'monthMar'.i18n(),
    'monthApr'.i18n(),
    'monthMay'.i18n(),
    'monthJun'.i18n(),
    'monthJul'.i18n(),
    'monthAug'.i18n(),
    'monthSep'.i18n(),
    'monthOct'.i18n(),
    'monthNov'.i18n(),
    'monthDec'.i18n(),
  ][month-1];
}

//TODO: add functions to Extension
/*

String getFormattedDate(DateTime date) {
  int year = date.year;
  int month = date.month;
  int day = date.day;
  return '${day.toString().padLeft(2, '0')} ${_monthNamesFormat1()[month - 1]} $year';
}
*/

/*

Month getMonth({required int month}) {
  return Month(month: month, shortName: _monthShortNames()[month - 1], name: _monthNames()[month - 1]);
}
*/

/*
List<String> _monthNames() {
  return [
    LocaleKeys.monthJan.tr(),
    LocaleKeys.monthFeb.tr(),
    LocaleKeys.monthMar.tr(),
    LocaleKeys.monthApr.tr(),
    LocaleKeys.monthMay.tr(),
    LocaleKeys.monthJun.tr(),
    LocaleKeys.monthJul.tr(),
    LocaleKeys.monthAug.tr(),
    LocaleKeys.monthSep.tr(),
    LocaleKeys.monthOct.tr(),
    LocaleKeys.monthNov.tr(),
    LocaleKeys.monthDec.tr(),
  ];
}

List<String> _monthNamesFormat1() {
  return [
    LocaleKeys.monthJan.tr(),
    LocaleKeys.monthFeb.tr(),
    LocaleKeys.monthMar.tr(),
    LocaleKeys.monthApr.tr(),
    LocaleKeys.monthMay.tr(),
    LocaleKeys.monthJun.tr(),
    LocaleKeys.monthJul.tr(),
    LocaleKeys.monthAug.tr(),
    LocaleKeys.monthSep.tr(),
    LocaleKeys.monthOct.tr(),
    LocaleKeys.monthNov.tr(),
    LocaleKeys.monthDec.tr(),
  ];
}

List<String> _monthShortNames() {
  return [
    LocaleKeys.monthJan.tr(),
    LocaleKeys.monthFeb.tr(),
    LocaleKeys.monthMar.tr(),
    LocaleKeys.monthApr.tr(),
    LocaleKeys.monthMay.tr(),
    LocaleKeys.monthJun.tr(),
    LocaleKeys.monthJul.tr(),
    LocaleKeys.monthAug.tr(),
    LocaleKeys.monthSep.tr(),
    LocaleKeys.monthOct.tr(),
    LocaleKeys.monthNov.tr(),
    LocaleKeys.monthDec.tr(),
  ];
}

*/
