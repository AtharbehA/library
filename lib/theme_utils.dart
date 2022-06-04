

import 'package:flutter/material.dart';

class ThemeApp{

  static final light = ThemeData(

    primaryColor: Colors.white,
    backgroundColor: Colors.white,
    brightness: Brightness.light
  );

  static final dark = ThemeData(
      primaryColor: Colors.red,
      backgroundColor: Colors.red,
      brightness: Brightness.dark
  );
}