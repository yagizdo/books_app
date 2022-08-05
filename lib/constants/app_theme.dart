import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.yellow,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.yellow,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
