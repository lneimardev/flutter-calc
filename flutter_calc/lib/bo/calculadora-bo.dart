import 'dart:convert';
import 'package:flutter_calc/model/calculo.dart';
import 'package:flutter_calc/requests/requests.dart';

Future<Calculo> executaCalculo(
    double numero1, double numero2, String operacao) async {
  try {
    var response = await httpCalculo(numero1, numero2, operacao);

    // TODO: ver quand der erro, como exibir 
    if (response.statusCode == 200) {
      Calculo cl =
          Calculo.fromJson(json.decode(utf8.decode(response.bodyBytes)));

      print(cl);
      return cl;
    }
  } catch (e) {
    print('Erro ao fazer a o calculo: $e');
  }

  return null;
}
