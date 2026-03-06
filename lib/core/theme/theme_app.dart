import 'package:flutter/material.dart';

abstract class ThemeApp {
  Color get primaryColor;

  Color get backgroundColor;

  Color get labelColor;


  ThemeData themeData();
}
