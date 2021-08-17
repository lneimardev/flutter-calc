import 'package:flutter/material.dart';
import 'package:flutter_calc/view/components/PageBaseWithScaffold.dart';

class CalcPage extends StatefulWidget {
  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  @override
  Widget build(BuildContext context) {
    return PageBaseWithScaffold(child: Container(), title: "Calculadora");
  }
}
