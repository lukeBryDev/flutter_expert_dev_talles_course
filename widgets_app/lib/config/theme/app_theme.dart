import 'package:flutter/material.dart';

final colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.greenAccent,
  Colors.lightGreenAccent,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 1})
      : assert(
            selectedColor >= 0, 'selectedColor color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'selectedColor must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
      );
}
