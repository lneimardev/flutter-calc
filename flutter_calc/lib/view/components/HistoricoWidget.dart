import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calc/model/historico.dart';
import 'package:flutter_calc/view/utils/utils.dart';
import 'package:grouped_list/grouped_list.dart';

class HistoricoWidget extends StatelessWidget {
  const HistoricoWidget({
    Key key,
    this.data,
    this.subtitle2,
    this.headline5,
  }) : super(key: key);

  final List<Historico> data;
  final TextStyle subtitle2;
  final TextStyle headline5;

  @override
  Widget build(BuildContext context) {
    return GroupedListView<dynamic, DateTime>(
        elements: this.data,
        groupBy: (element) => element.dataCalculo,
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1.dataCalculo.compareTo(item2.dataCalculo),
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: false,
        groupSeparatorBuilder: (DateTime value) => Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(left: 90, right: 90, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.deepPurple),
              child: Text(
                formtDateToStr(value, "dd/MM/yyyy"),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
        itemBuilder: (c, element) => _buildHistoricoItem(element));
  }

  _buildHistoricoItem(Historico record) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _historicoValorItem(
                header: record.valor1Header,
                value: record.valor1,
                subtitle2: this.subtitle2,
                headline5: this.headline5,
              ),
              _historicoValorItem(
                  header: record.operacaoHeader,
                  value: record.operacao,
                  subtitle2: this.subtitle2,
                  headline5: this.headline5),
              _historicoValorItem(
                  header: record.valor2Header,
                  value: record.valor2,
                  subtitle2: this.subtitle2,
                  headline5: this.headline5),
              Text(
                " = ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              _historicoValorItem(
                  header: record.resultadoHeader,
                  value: record.resultado,
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
