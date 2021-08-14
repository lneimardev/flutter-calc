import 'package:flutter/material.dart';
import 'package:flutter_calc/bo/historico-bo.dart';
import 'package:flutter_calc/model/historico.dart';
import 'package:flutter_calc/view/components/HistoricoWidget.dart';
import 'package:flutter_calc/view/components/PageBase.dart';
import 'package:flutter_calc/view/utils/utils.dart';
import 'package:grouped_list/grouped_list.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
                    title: Text("Histórico",
                        style: Theme.of(context).textTheme.headline3),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    centerTitle: true,
                  ),
                  body: PageBase(child: _historicoList())))),
    );
  }

  _historicoList() {
    return FutureBuilder<List<Historico>>(
        future: dadosListHistorico(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Historico>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // TODO: Melhorar o visual do progress indicator
            return Container(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }

          if (snapshot != null &&
              snapshot.data != null &&
              snapshot.data.isNotEmpty) {
            return GroupedListView<dynamic, DateTime>(
              elements: snapshot.data,
              groupBy: (element) => element.dataCalculo,
              groupComparator: (value1, value2) => value2.compareTo(value1),
              itemComparator: (item1, item2) =>
                  item1.dataCalculo.compareTo(item2.dataCalculo),
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: false,
              groupSeparatorBuilder: (DateTime value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  formtDateToStr(value, "dd/MM/yyyy"),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              itemBuilder: (c, element) {
                return HistoricoValores(
                  headline5: Theme.of(context).textTheme.headline5,
                  subtitle2: Theme.of(context).textTheme.subtitle2,
                  record: Historico(
                      valor1: element.valor1,
                      valor2: element.valor2,
                      operacao: element.operacao,
                      resultado: element.resultado),
                );
              },
            );
          }

          // TODO: Melhorar o visual do texto de quando não tem dados
          return Center(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Sem dados para serem exibidos...")),
          );
        });
  }
}
