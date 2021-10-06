import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constant {
  static final PRIMARY_COLOR = Color.fromRGBO(86, 117, 230, 1);
  static final COLOR_SCHEME = ColorScheme(
    primary: PRIMARY_COLOR,
    primaryVariant: Colors.black,
    secondary: Colors.deepOrange,
    secondaryVariant: Colors.brown,
    surface: Colors.cyan,
    background: Colors.grey,
    error: Colors.indigo,
    onPrimary: Colors.yellow,
    onSecondary: Colors.lime,
    onSurface: Colors.pinkAccent,
    onBackground: PRIMARY_COLOR,
    onError: Colors.red,
    brightness: Brightness.light,
  );
}
