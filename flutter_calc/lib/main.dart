import 'package:flutter/material.dart';
import 'package:flutter_calc/view/pages/HomePage.dart';
import 'package:flutter_calc/view/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      theme: themeDataLigth,
      home: MyHomePage(),
    );
  }
}
