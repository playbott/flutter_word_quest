import 'package:cword/ui/const.dart';
import 'package:flutter/material.dart';

class DarkThemeConst {
  static final darkTheme = ThemeData.dark().copyWith(
    secondaryHeaderColor: AppConstants.mainColor3,
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: AppConstants.greyColor,
      indicatorColor: AppConstants.mainColorDark,
      dividerColor: AppConstants.mainColorDark.withOpacity(0.2),
      labelColor: AppConstants.mainColorDark,
    ),
    indicatorColor: AppConstants.mainColorDark,
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(Colors.grey.shade300),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color.fromARGB(255, 70, 69, 69),
      focusColor: AppConstants.mainColorDark,
      hoverColor: AppConstants.mainColorDark,
      iconColor: AppConstants.mainColorDark,
      prefixIconColor: AppConstants.textColorLight,
      suffixIconColor: AppConstants.mainColorDark,
      prefixStyle: TextStyle(
        color: AppConstants.textColorDark,
      ),
      hintStyle: TextStyle(color: AppConstants.mainColorDark),
      labelStyle: TextStyle(color: AppConstants.mainColorDark),
      floatingLabelStyle: TextStyle(color: AppConstants.mainColorDark),
      border: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppConstants.textColorDark, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppConstants.textColorDark, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppConstants.textColorDark, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Colors.redAccent, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppConstants.textColorDark, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
    ),
    primaryColorLight: AppConstants.mainColor,
    primaryColorDark: AppConstants.mainColorDark,
    primaryColor: AppConstants.mainColorDark,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppConstants.mainColorDark),
    dialogBackgroundColor: AppConstants.blackColor,
    highlightColor: AppConstants.blackColor.withOpacity(0.5),
    focusColor: AppConstants.mainColorDark.withOpacity(0.6),
    dividerColor: AppConstants.whiteColor,
    hintColor: Colors.white.withOpacity(.5),
    dividerTheme: DividerThemeData(
      color: AppConstants.mainColorDark.withOpacity(0.2),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shadowColor: AppConstants.greyColor,
      surfaceTintColor: AppConstants.greyColor,
      backgroundColor: AppConstants.greyColor,
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: AppConstants.darkColor),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppConstants.mainColorDark,
      selectionColor: AppConstants.selectioncolor,
      selectionHandleColor: AppConstants.mainColorDark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppConstants.mainColor,
      foregroundColor: AppConstants.whiteColor,
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(39, 52, 51, 1.0),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppConstants.appBarDark,
      unselectedItemColor: Colors.white,
      selectedItemColor: AppConstants.bottomBarIconSelectedColorDark,
    ),
    cardColor: AppConstants.cardColorDark,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppConstants.textColorDark),
      bodySmall: TextStyle(color: AppConstants.textColorDark),
      bodyLarge: TextStyle(color: AppConstants.textColorDark),
      titleLarge: TextStyle(color: AppConstants.textColorDark),
      titleMedium: TextStyle(color: AppConstants.textColorDark),
      titleSmall: TextStyle(color: AppConstants.textColorDark),
      labelLarge: TextStyle(color: AppConstants.textColorDark),
      labelMedium: TextStyle(color: AppConstants.textColorDark),
      labelSmall: TextStyle(color: AppConstants.textColorDark),
      headlineSmall: TextStyle(color: AppConstants.textColorDark),
      headlineLarge: TextStyle(color: AppConstants.textColorDark),
      headlineMedium: TextStyle(color: AppConstants.textColorDark),
      displayLarge: TextStyle(color: AppConstants.textColorDark),
      displaySmall: TextStyle(color: AppConstants.textColorDark),
      displayMedium: TextStyle(color: AppConstants.textColorDark),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme:
          InputDecorationTheme(fillColor: AppConstants.cardColorDark),
      menuStyle: MenuStyle(
        side: WidgetStateBorderSide.resolveWith(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return BorderSide(
              color: Colors.transparent,
              width: 0,
            );
          }
          return BorderSide(
            color: Colors.transparent,
            width: 0,
          );
        }),
        backgroundColor:
            WidgetStatePropertyAll<Color>(AppConstants.cardColorDark),
        surfaceTintColor:
            WidgetStatePropertyAll<Color>(AppConstants.cardColorDark),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll<Color>(AppConstants.mainColorDark))),
    appBarTheme: AppBarTheme(
      foregroundColor: AppConstants.mainColorDark,
      surfaceTintColor: const Color.fromARGB(255, 24, 29, 34),
      backgroundColor: AppConstants.appBarDark,
      toolbarTextStyle: const TextTheme(
        displayLarge: TextStyle(color: AppConstants.mainColorDark),
      ).displayLarge,
      titleTextStyle: const TextTheme(
        displayLarge: TextStyle(color: AppConstants.whiteColor),
      ).displayLarge,
    ),
    iconTheme: const IconThemeData(
      color: AppConstants.whiteColor,
    ),
    canvasColor: AppConstants.whiteColor,
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppConstants.mainColorDark,
      todayBackgroundColor: WidgetStatePropertyAll(AppConstants.whiteColor),
    ),
    colorScheme: const ColorScheme.dark(
      surface: AppConstants.greyColor1,
      onSurface: AppConstants.darkColor,
    ).copyWith(surface: AppConstants.whiteColor),
  );
}
