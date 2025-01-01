import 'package:flutter/material.dart';
export 'text.dart';

const searchBarHeight = 40.0;

const headBarHeight = 40.0;

const borderRadius1 = 5.0;
const borderRadius2 = 10.0;
const borderRadius3 = 15.0;
const borderRadius4 = 20.0;
const borderRadius5 = 25.0;
const borderRadius6 = 30.0;
const borderRadius7 = 35.0;
const borderRadius500 = 500.0;
class AppConstants {
  //colors
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color mainColor = Color.fromRGBO(155, 67, 218, 1.0);
  static const Color mainColor2 = Color.fromRGBO(104, 41, 178, 1.0);
  static const Color mainColor3 = Color.fromRGBO(188, 22, 234, 1.0);

  // static const Color mainColor = Color.fromRGBO(68, 175, 123, 1);
  static const Color mainColorDark = mainColor3;
  static const Color selectioncolor = Color.fromRGBO(216, 137, 255, 1.0);

  static const cardValueColor = mainColor3;

  // static const Color mainColorDark = Color.fromRGBO(74, 220, 204, 1.0);
  static const Color textColorLight = Color.fromRGBO(21, 21, 21, 1.0);
  static const Color textColorDark = Color.fromRGBO(240, 240, 240, 1.0);
  static const Color lightBlueColor = Color(0xff469ED2);
  static const Color blueColor = Color(0xff0075FF);
  static const Color redColor = Colors.red;
  static const Color yellowColor = Color.fromARGB(255, 244, 190, 54);
  static const Color greyColor = Colors.grey;
  static const Color greyColor1 = Color.fromARGB(255, 245, 243, 243);
  static const Color transpColor = Colors.transparent;
  static const Color darkColor = Color.fromARGB(255, 19, 25, 30);
  static const Color appBarDark = Color.fromRGBO(36, 38, 38, 1.0);
  static const Color appBarLight = Color.fromARGB(255, 248, 248, 248);
  static const Color cardColorDark = Color.fromARGB(255, 58, 58, 58);
  static const Color cardColorLight = Color.fromARGB(255, 250, 250, 250);
  static const Color darkPurple = Color.fromARGB(255, 1, 2, 41);
  static const Color bottomBarBgColor = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color bottomBarIconSelectedColor = mainColor;
  static const Color bottomBarIconSelectedColorDark = mainColor3;

  static final borderRadius5 = BorderRadius.circular(5);
  static final borderRadius6 = BorderRadius.circular(6);
  static final borderRadius7 = BorderRadius.circular(7);
  static final borderRadius8 = BorderRadius.circular(8);
  static final borderRadius10 = BorderRadius.circular(10);
  static final borderRadius12 = BorderRadius.circular(12);
  static final borderRadius15 = BorderRadius.circular(15);
  static final borderRadius20 = BorderRadius.circular(20);
}

//fonts
const String defaultFont = 'WixMadeforDisplay';

class FontFamilies {
  static const wixMadeforDisplay = 'WixMadeforDisplay';
  static const montserrat = 'Montserrat';
}

List colorText = [
  {'color': Colors.amber, 'colorTitle': 'sary'},
  {'color': Colors.black, 'colorTitle': 'gara'},
  {'color': Colors.blue, 'colorTitle': 'gok'},
  {'color': Colors.brown, 'colorTitle': 'gonur'},
  {'color': Colors.deepOrange, 'colorTitle': 'mamisi'},
  {'color': Colors.deepPurple, 'colorTitle': 'cyrnyl'},
  {'color': Colors.green, 'colorTitle': 'yasyl'},
  {'color': Colors.grey, 'colorTitle': 'cal'},
  {'color': Colors.pink, 'colorTitle': 'gulgune'},
  {'color': Colors.red, 'colorTitle': 'gyzyl'},
  {'color': Colors.white, 'colorTitle': 'ak'},
];

final List<dynamic> categoryColors = [
  {
    'color': AppConstants.blueColor,
  },
  {
    'color': const Color.fromARGB(255, 57, 220, 215),
  },
  {
    'color': Colors.orangeAccent,
  },
  {
    'color': const Color.fromARGB(255, 16, 138, 214),
  },
  {
    'color': Colors.pink,
  },
  {
    'color': const Color.fromARGB(255, 29, 209, 101),
  },
  {
    'color': Colors.indigo,
  },
  {
    'color': Colors.lime,
  },
  {
    'color': const Color.fromARGB(255, 114, 114, 114),
  },
  {
    'color': const Color.fromARGB(255, 195, 64, 255),
  },
  {
    'color': const Color.fromARGB(255, 255, 64, 64),
  },
];
