import 'package:flutter/material.dart';
import 'package:flutter_calc/bo/calculadora-bo.dart';
import 'package:flutter_calc/model/calculo.dart';
import 'package:flutter_calc/view/components/CardBase.dart';
import 'package:flutter_calc/view/components/PageBaseWithScaffold.dart';

class CalcPage extends StatefulWidget {
  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  String _resultado = "";
  String _numero1 = "";
  String _numero2 = "";
  String _operacao = "";
  bool _isOperacao = false;

  @override
  Widget build(BuildContext context) {
    return PageBaseWithScaffold(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(_numero1 + _operacao + _numero2,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontSize: 36)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Theme.of(context).cardColor,
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        " = $_resultado",
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontSize: 32),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCalcButton(buttonText: "AC"),
                  _buildCalcButton(buttonText: "<X"),
                  _buildCalcButton(buttonText: "%"),
                  _buildCalcButton(buttonText: " / ", b: true)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCalcButton(buttonText: "7"),
                  _buildCalcButton(buttonText: "8"),
                  _buildCalcButton(buttonText: "9"),
                  _buildCalcButton(buttonText: " * ", b: true)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCalcButton(buttonText: "4"),
                  _buildCalcButton(buttonText: "5"),
                  _buildCalcButton(buttonText: "6"),
                  _buildCalcButton(buttonText: " - ", b: true),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCalcButton(buttonText: "1"),
                  _buildCalcButton(buttonText: "2"),
                  _buildCalcButton(buttonText: "3"),
                  _buildCalcButton(buttonText: " + ", b: true)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCalcButton(buttonText: ""),
                  _buildCalcButton(buttonText: "0"),
                  _buildCalcButton(buttonText: "."),
                  _buildCalcButton(buttonText: " = "),
                ],
              )
            ],
          ),
        ),
        title: "Calculadora");
  }

  _buildCalcButton({String buttonText, bool b = false}) {
    return CardBase(
      heigth: 70,
      width: 70,
      horizontalPadding: 5,
      verticalPadding: 5,
      onTapCard: () async {
        if (buttonText == "AC") {
          _resultado = "0";
          _numero1 = "0";
          _numero2 = "";
          _operacao = "";
          _isOperacao = false;
        } else if (b) {
          if (!_isOperacao) {
            _isOperacao = true;
            _operacao = buttonText;
          }
        } else if (buttonText == "<X") {
          // TODO: Implementar aqui apagar o último dígito
        } else if (buttonText == " = ") {
          // TODO: Implementar aqui a chamada da api para que faça o cálculo
          // executaCalculo( double numero1, double numero2, String operacao)

          // TODO: tratar quando o minha variavel c[aclulo vier null]
          Calculo calc = await executaCalculo(
              double.parse(_numero1), double.parse(_numero2), _operacao.trim());

          _resultado = calc.resultado.toString();
        } else if (_numero1.length > 12 || _numero2.length > 12) {
          // TODO: Exibir uma mensagem ao usuário que passou do limite
        } else {
          if (_isOperacao) {
            _numero2 += buttonText;
          } else {
            _numero1 += buttonText;
          }
        }

        setState(() {});
      },
      child: Center(
          child: Text(
        buttonText,
        style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 32),
      )),
    );
  }
}
