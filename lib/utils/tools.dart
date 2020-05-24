import 'package:flutter/material.dart';

class Tools {
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF0000000);
  }

  static List<Color> multiColors = [
    Colors.red,
    Colors.amber,
    Colors.green,
    Colors.blue
  ];

  static String TimeExtracter(String value) {
    String str = value;
    const start = "T";
    const end = "Z";

    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);

    //print(str.substring(startIndex + start.length, endIndex));
    // brown fox jumps
    return str.substring(startIndex + start.length, endIndex);
  }

  static String DateExtracter(String value) {
    String str = value;
    var start = value[0];
    const end = "T";

    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);

    //print(str.substring(startIndex + start.length, endIndex));
    // brown fox jumps
    return "2" + str.substring(startIndex + start.length, endIndex);
  }
}
