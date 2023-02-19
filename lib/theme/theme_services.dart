import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeService{
  final lightTheme = ThemeData(
    appBarTheme:  AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
      ),
      color: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.indigo,
        fontSize: 20.0,
        fontWeight: FontWeight.w900,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        textStyle: const TextStyle(
          color: Colors.cyanAccent,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.tajawal(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),

    ),
    brightness: Brightness.dark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.cyanAccent,
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  final darkTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.black,
          textStyle: const TextStyle(
            color: Colors.cyanAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
        ),
      ),
    brightness: Brightness.dark,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),


    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.indigo,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light
      ),
      color: Colors.black,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w900,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: Colors.black
  );

  final _getStorage = GetStorage();
  final _darkThemeKey = 'IsDarkTheme';

  void saveThemeData(bool isDarkMode){
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode(){
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode(){
    return isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark;
  }

  void changeTheme(){
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light);
    saveThemeData(!isSavedDarkMode());
  }

}