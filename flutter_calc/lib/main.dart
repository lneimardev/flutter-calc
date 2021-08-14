import 'package:flutter/material.dart';
import 'package:flutter_calc/view/pages/HomePage.dart';
import 'package:flutter_calc/view/theme/theme.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {

  initializeDateFormatting('pt_BR', null);

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
