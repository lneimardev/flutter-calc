import 'package:flutter/material.dart';

ThemeData themeDataLigth = ThemeData(
    scaffoldBackgroundColor: Colors.amber[600],
    primaryColor: Colors.amber[600],
    backgroundColor: Colors.amber.withOpacity(0.5),
    cardColor: Colors.white70,
    shadowColor: Colors.amber[800],
    indicatorColor: Colors.deepPurple,
    iconTheme: IconThemeData(color: Colors.deepPurple),
    textTheme: TextTheme(
        headline5: TextStyle(
            fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
        headline4: TextStyle(
            fontSize: 16,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold),
        headline3: TextStyle(
            fontSize: 20,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        headline1: TextStyle(
            fontSize: 44,
            color: Colors.amber[800],
            fontWeight: FontWeight.bold),
        subtitle1: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        subtitle2: TextStyle(fontSize: 10)));
