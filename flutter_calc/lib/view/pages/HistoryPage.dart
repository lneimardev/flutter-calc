import 'package:flutter/material.dart';
import 'package:flutter_calc/bo/historico-bo.dart';
import 'package:flutter_calc/model/historico.dart';
import 'package:flutter_calc/view/components/HistoricoWidget.dart';
import 'package:flutter_calc/view/components/PageBase.dart';
import 'package:flutter_calc/view/components/PageBaseWithScaffold.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return PageBaseWithScaffold(child: _historicoList(), title: "Histórico");
  }

  _historicoList() {
    return FutureBuilder<List<Historico>>(
        future: dadosListHistorico(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Historico>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  backgroundColor: Colors.deepPurple,
                ),
              ),
            );
          }

          if (snapshot != null &&
              snapshot.data != null &&
              snapshot.data.isNotEmpty) {
            return HistoricoWidget(
              data: snapshot.data,
              headline5: Theme.of(context).textTheme.headline5,
              subtitle2: Theme.of(context).textTheme.subtitle2,
            );
          }

          return Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Sem dados para serem exibidos...",
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
