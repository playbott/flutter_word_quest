import 'package:flutter/material.dart';

import '../const.dart';

class LightThemeConst {
  static final lightTheme = ThemeData.light().copyWith(
      secondaryHeaderColor: AppConstants.mainColor,
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: AppConstants.lightBlueColor,
        indicatorColor: AppConstants.mainColor,
        dividerColor: AppConstants.mainColor.withOpacity(0.2),
        labelColor: AppConstants.mainColor,
      ),
      indicatorColor: AppConstants.mainColor,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(AppConstants.mainColor.withOpacity(0.4)),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.white,
        focusColor: AppConstants.mainColor,
        hoverColor: AppConstants.mainColor,
        iconColor: AppConstants.mainColor,
        prefixIconColor: AppConstants.textColorLight,
        suffixIconColor: AppConstants.mainColor,
        prefixStyle: TextStyle(color: AppConstants.textColorLight),
        hintStyle: TextStyle(color: AppConstants.mainColor),
        labelStyle: TextStyle(color: AppConstants.mainColor),
        floatingLabelStyle: TextStyle(color: AppConstants.mainColor),
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
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppConstants.mainColor,
        foregroundColor: AppConstants.whiteColor,
      ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppConstants.mainColor,
          selectionColor: AppConstants.selectioncolor,
          selectionHandleColor: AppConstants.mainColor),
      primaryColorLight: AppConstants.mainColor,
      primaryColorDark: AppConstants.mainColorDark,
      primaryColor: AppConstants.mainColor,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppConstants.mainColor),
      focusColor: AppConstants.greyColor1,
      dialogBackgroundColor: AppConstants.whiteColor,
      highlightColor: AppConstants.whiteColor.withOpacity(0.5),
      drawerTheme:
          const DrawerThemeData(backgroundColor: AppConstants.whiteColor),
      dividerColor: AppConstants.blackColor,
      // scaffoldBackgroundColor: Color.fromRGBO(1, 129, 94, 1),
      scaffoldBackgroundColor: const Color.fromRGBO(234, 241, 239, 1.0),
      cardColor: AppConstants.cardColorLight,
      hintColor: AppConstants.greyColor,
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme:
            InputDecorationTheme(fillColor: AppConstants.cardColorLight),
        menuStyle: MenuStyle(
          backgroundColor:
              WidgetStatePropertyAll<Color>(AppConstants.cardColorLight),
          surfaceTintColor:
              WidgetStatePropertyAll<Color>(AppConstants.cardColorLight),
        ),
      ),
      dividerTheme:
          DividerThemeData(color: AppConstants.mainColor.withOpacity(0.2)),
      bottomSheetTheme: const BottomSheetThemeData(
        shadowColor: AppConstants.whiteColor,
        surfaceTintColor: AppConstants.whiteColor,
        backgroundColor: AppConstants.bottomBarBgColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppConstants.bottomBarBgColor,
        unselectedItemColor: AppConstants.mainColor,
        selectedItemColor: AppConstants.bottomBarIconSelectedColor,
      ),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppConstants.textColorLight),
          bodySmall: TextStyle(color: AppConstants.textColorLight),
          bodyLarge: TextStyle(color: AppConstants.textColorLight),
          titleLarge: TextStyle(color: AppConstants.textColorLight),
          titleMedium: TextStyle(color: AppConstants.textColorLight),
          titleSmall: TextStyle(color: AppConstants.textColorLight),
          labelLarge: TextStyle(color: AppConstants.textColorLight),
          labelMedium: TextStyle(color: AppConstants.textColorLight),
          labelSmall: TextStyle(color: AppConstants.textColorLight),
          headlineSmall: TextStyle(color: AppConstants.textColorLight),
          headlineLarge: TextStyle(color: AppConstants.textColorLight),
          headlineMedium: TextStyle(color: AppConstants.textColorLight),
          displayLarge: TextStyle(color: AppConstants.mainColor)),
      appBarTheme: AppBarTheme(
        backgroundColor: AppConstants.mainColor,
        foregroundColor: AppConstants.whiteColor,
        surfaceTintColor: AppConstants.whiteColor,
        // color: AppConstants.whiteColor,
        // systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarTextStyle: const TextTheme(
                displayLarge: TextStyle(color: AppConstants.whiteColor))
            .displayLarge,
        titleTextStyle: const TextTheme(
                displayLarge: TextStyle(color: AppConstants.whiteColor))
            .displayLarge,
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll<Color>(AppConstants.mainColor))),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      iconTheme: const IconThemeData(
        color: AppConstants.mainColor,
      ),
      datePickerTheme: const DatePickerThemeData(
          backgroundColor: AppConstants.greyColor1,
          surfaceTintColor: AppConstants.greyColor1),
      canvasColor: AppConstants.mainColor,
      colorScheme: const ColorScheme.light(
        surface: AppConstants.greyColor1,
        onSurface: AppConstants.greyColor1,
      ).copyWith(surface: AppConstants.blackColor));
}
