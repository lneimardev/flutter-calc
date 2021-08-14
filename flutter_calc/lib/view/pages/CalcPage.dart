import 'package:flutter/material.dart';
import 'package:flutter_calc/view/components/PageBase.dart';

class CalcPage extends StatefulWidget {
  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  @override
  Widget build(BuildContext context) {

    // TODO: migrar o scafold para dentro do page base
    return SafeArea(
      child: Material(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          type: MaterialType.card,
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 15,
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Scaffold(
                  appBar: AppBar(
                    title: Text("Calculadora",
                        style: Theme.of(context).textTheme.headline3),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    centerTitle: true,
                  ),
                  body: PageBase(child: Container())))),
    );
  }
}
