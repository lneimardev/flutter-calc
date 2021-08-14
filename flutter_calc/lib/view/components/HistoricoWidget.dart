import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calc/model/historico.dart';

class HistoricoValores extends StatelessWidget {
  const HistoricoValores({
    Key key,
    this.record,
    this.subtitle2,
    this.headline5,
  }) : super(key: key);

  final Historico record;
  final TextStyle subtitle2;
  final TextStyle headline5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _historicoValorItem(
                header: this.record.valor1Header,
                value: this.record.valor1,
                subtitle2: this.subtitle2,
                headline5: this.headline5,
              ),
              _historicoValorItem(
                  header: this.record.operacaoHeader,
                  value: this.record.operacao,
                  subtitle2: this.subtitle2,
                  headline5: this.headline5),
              _historicoValorItem(
                  header: this.record.valor2Header,
                  value: this.record.valor2,
                  subtitle2: this.subtitle2,
                  headline5: this.headline5),
              Text(
                " = ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              _historicoValorItem(
                  header: this.record.resultadoHeader,
                  value: this.record.resultado,
                  subtitle2: this.subtitle2,
                  headline5: this.headline5),
            ],
          ),
          Divider(
            thickness: 1,
            endIndent: 5,
            indent: 5,
          )
        ],
      ),
    );
  }
}

class _historicoValorItem extends StatelessWidget {
  const _historicoValorItem({
    Key key,
    @required this.header,
    @required this.value,
    this.subtitle2,
    this.headline5,
  }) : super(key: key);

  final String header;
  final String value;
  final TextStyle subtitle2;
  final TextStyle headline5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          this.header,
          style: this.subtitle2,
          textAlign: TextAlign.center,
        ),
        Text(
          this.value,
          style: this.headline5,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
