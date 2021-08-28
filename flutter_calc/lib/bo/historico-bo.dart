import 'package:flutter_calc/model/historico.dart';

Future<List<Historico>> dadosListHistorico() async {
  try {
    
    // TODO: Implementar a chama da api 
    //List<Historico> list = await <chamada da api>

    // TODO: Remover esse delay aqui, esta aqui apenas para ver o circular indicator
    await Future.delayed(Duration(seconds: 5));

    List<Historico> list = [];
    Historico hist;
    DateTime referencia = DateTime.now();

    hist = Historico(
        dataCalculo: referencia.subtract(Duration(days: 2)),
        valor1: "5",
        valor2: "5",
        operacao: " + ",
        resultado: "10");

    list.add(hist);

    hist = Historico(
        dataCalculo: referencia.subtract(Duration(days: 2)),
        valor1: "5",
        valor2: "6",
        operacao: " + ",
        resultado: "11");

    list.add(hist);

    hist = Historico(
        dataCalculo: referencia.subtract(Duration(days: 2)),
        valor1: "5",
        valor2: "7",
        operacao: " + ",
        resultado: "12");

    list.add(hist);

    hist = Historico(
        dataCalculo: referencia.subtract(Duration(days: 2)),
        valor1: "5",
        valor2: "5",
        operacao: " - ",
        resultado: "0");

    list.add(hist);

    hist = Historico(
        dataCalculo: referencia.subtract(Duration(days: 2)),
        valor1: "7",
        valor2: "2",
        operacao: " + ",
        resultado: "9");

    list.add(hist);

    hist = Historico(
        dataCalculo: referencia.subtract(Duration(days: 1)),
        valor1: "5",
        valor2: "5",
        operacao: " + ",
        resultado: "10");

    list.add(hist);

    hist = Historico(
        dataCalculo: referencia.subtract(Duration(days: 1)),
        valor1: "5",
        valor2: "5",
        operacao: " * ",
        resultado: "25");

    list.add(hist);

    hist = Historico(
        dataCalculo: referencia,
        valor1: "5",
        valor2: "5",
        operacao: " + ",
        resultado: "10");

    list.add(hist);

    hist = Historico(
        dataCalculo: referencia,
        valor1: "5",
        valor2: "2",
        operacao: " + ",
        resultado: "7");

    list.add(hist);

    return list;
  } catch (e) {
    print(e);
  }

  return [];
}