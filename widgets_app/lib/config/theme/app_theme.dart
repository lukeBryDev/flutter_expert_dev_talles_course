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
  final bool isDarkMode;

  AppTheme({this.selectedColor = 1, this.isDarkMode = false})
      : assert(
            selectedColor >= 0, 'selectedColor color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'selectedColor must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
      );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
