import 'package:flutter/material.dart';
import 'package:flutter_calc/model/historico.dart';
import 'package:flutter_calc/view/components/CardBase.dart';
import 'package:flutter_calc/view/components/PageBase.dart';
import 'package:flutter_calc/view/pages/SecondPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isCollapsed = true;
  int MENU_ITEM_HOME = 1;
  int MENU_ITEM_SECP = 2;
  int MENU_ITEMAVALI = 3;

  int _selectedMenu = 1;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    Size _pageSize = MediaQuery.of(context).size;

    double _percentage = 0.55;
    double _defaultPadding = 10;

    return PageBase(
        child: Stack(
      children: [
        _menu(_percentage, _defaultPadding),
        AnimatedPositioned(
          left: isCollapsed ? 0 : _pageSize.width * _percentage,
          right: isCollapsed ? 0 : _pageSize.width * -_percentage,
          top: isCollapsed ? 0 : _pageSize.height * 0.1,
          bottom: isCollapsed ? 0 : _pageSize.height * 0.1,
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInBack,
          child: _context(),
        )
      ],
    ));

    //Scaffold(
    //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //   body: );
  }

  Widget _context() {
    var _size = MediaQuery.of(context).size;

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
            title:
                Text("Conteúdo", style: Theme.of(context).textTheme.headline3),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            leading: IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Colors.deepPurple,
                progress: _animationController,
              ),
              onPressed: () {
                setState(() {
                  if (isCollapsed) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }

                  isCollapsed = !isCollapsed;
                });
              },
            ),
          ),
          body: PageBase(
            child: ListView(
              children: [
                SizedBox(height: 20),

                _Header(
                  context: context,
                  text: "Seja bem vindo!",
                ),
                
                CardBase(
                  heigth: 350,
                  width: _size.width * 0.95,
                  horizontalPadding: 15,
                  verticalPadding: 15,
                  backgroundColor: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "5,000",
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                Text(
                                  "calculos realizados",
                                  style: Theme.of(context).textTheme.subtitle1,
                                )
                              ],
                            ),
                            Icon(
                              Icons.person,
                              size: 60,
                              color: Theme.of(context).shadowColor,
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        endIndent: 10,
                        indent: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: _size.width * 0.85,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .backgroundColor
                                .withOpacity(0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: ListView(
                          children: [
                            _historicoValores(
                              record: Historico(
                                  valor1: "5",
                                  valor2: "5",
                                  operacao: " + ",
                                  resultado: "10"),
                            ),
                            _historicoValores(
                              record: Historico(
                                  valor1: "5",
                                  valor2: "2",
                                  operacao: " + ",
                                  resultado: "7"),
                            ),
                            _historicoValores(
                              record: Historico(
                                  valor1: "5",
                                  valor2: "5",
                                  operacao: " - ",
                                  resultado: "0"),
                            ),
                            _historicoValores(
                              record: Historico(
                                  valor1: "5",
                                  valor2: "5",
                                  operacao: " + ",
                                  resultado: "10"),
                            ),
                            _historicoValores(
                              record: Historico(
                                  valor1: "10",
                                  valor2: "5",
                                  operacao: " + ",
                                  resultado: "15"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                _Header(
                  context: context,
                  text: "Acesso rápido",
                  align: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Theme.of(context).indicatorColor),
                ),
                _Summary(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _menu(double _percentage, double _defaultPadding) {
    _menuItem(String _title, IconData _icon, Function _onTap, int _index) =>
        Padding(
          padding: EdgeInsets.only(right: _defaultPadding),
          child: Material(
            color: _selectedMenu == _index
                ? Theme.of(context).shadowColor
                : Colors.transparent,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10)),
            child: ListTile(
                title: Text(
                  _title,
                  style: Theme.of(context).textTheme.headline4,
                ),
                contentPadding: EdgeInsets.only(left: _defaultPadding),
                leading: Icon(
                  _icon,
                  color: Colors.deepPurple,
                ),
                onTap: _onTap),
          ),
        );

    return Align(
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: _percentage,
        child: ListView(
          padding: EdgeInsets.only(top: 100, bottom: 50),
          children: [
            _menuItem("Home", Icons.home, () {}, MENU_ITEM_HOME),
            _menuItem("Calculadora", Icons.calculate, () {
              setState(() {
                _selectedMenu = MENU_ITEM_SECP;
              });

              //Get.to(SecondPage());

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            }, MENU_ITEM_SECP),
            SizedBox(
              height: _defaultPadding,
            ),
            _menuItem("Avaliar App", Icons.star_outline, () {}, MENU_ITEMAVALI),
          ],
        ),
      ),
    );
  }
}

class _historicoValores extends StatelessWidget {
  const _historicoValores({
    Key key,
    this.record,
  }) : super(key: key);

  final Historico record;

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
                  header: this.record.valor1Header, value: this.record.valor1),
              _historicoValorItem(
                  header: this.record.operacaoHeader,
                  value: this.record.operacao),
              _historicoValorItem(
                  header: this.record.valor2Header, value: this.record.valor2),
              Text(
                " = ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              _historicoValorItem(
                  header: this.record.resultadoHeader,
                  value: this.record.resultado),
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
  }) : super(key: key);

  final String header;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          this.header,
          style: Theme.of(context).textTheme.subtitle2,
          textAlign: TextAlign.center,
        ),
        Text(
          this.value,
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CardBase(
          heigth: 100,
          width: 100,
          horizontalPadding: 15,
          verticalPadding: 15,
        ),
        CardBase(
          heigth: 100,
          width: 100,
          horizontalPadding: 15,
          verticalPadding: 15,
        ),
        CardBase(
          heigth: 100,
          width: 100,
          horizontalPadding: 15,
          verticalPadding: 15,
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(
      {Key key,
      @required this.context,
      @required this.text,
      this.align,
      this.style})
      : super(key: key);

  final BuildContext context;
  final String text;
  final TextAlign align;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          this.text,
          style: this.style ??
              Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.white),
          textAlign: this.align ?? TextAlign.left,
        ));
  }
}
