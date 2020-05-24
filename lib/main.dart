import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutternews2/configer/index.dart';
import 'package:flutternews2/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  //*for transparent status bar
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
      )
  );
  Constants.perfs = await SharedPreferences.getInstance();

  runApp(ConfigerPage());
}
