import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  ///String
  static const String app_name = "Flutter News";
  static const String app_version = "Version 1.0.0";
  static const String google_sans_family = "Product Sans";
  static const String loadingText = "Loading...";
  static const String tryagainText = "try again";

  static Color primaryAppColor = Colors.white;
  static Color secondryAppColor = Colors.black;
  static bool isDebugMode = true;

  /// Preferences
  static SharedPreferences perfs;
  static const String darkModeperf = 'DarkModePerf';
}
