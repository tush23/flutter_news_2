import 'package:flutter/material.dart';
import 'package:flutternews2/views/home.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterNews",
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: Home(),
    );
  }
}