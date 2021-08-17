import 'package:flutter/material.dart';
import 'package:flutter_calc/bo/historico-bo.dart';
import 'package:flutter_calc/model/historico.dart';
import 'package:flutter_calc/view/components/CardBase.dart';
import 'package:flutter_calc/view/components/HistoricoWidget.dart';
import 'package:flutter_calc/view/components/PageBase.dart';
import 'package:flutter_calc/view/pages/CalcPage.dart';
import 'package:flutter_calc/view/pages/HistoryPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isCollapsed = true;
  int MENU_ITEM_HOME = 1;
  int MENU_ITEM_CALC = 2;
  int MENU_ITEMAVALI = 3;
  int MENU_ITEM_HIST = 4;

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

  _historicoList() {
    return FutureBuilder<List<Historico>>(
        future: dadosListHistorico(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Historico>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // TODO: Melhorar o visual do progress indicator
            return SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.deepPurple,
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
            child: Text("Sem dados para serem exibidos...", textAlign: TextAlign.center,),
          );
        });
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
            elevation: 0,
            leading: IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Colors.deepPurple,
                progress: _animationController,
              ),
              onPressed: _toggleMenu,
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
                          child: _historicoList())
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

    // TODO: ao voltar de uma outra página, fechar o menu se estiver aberto
    // TODO: ao voltar de uma outra página, reposiionar o index do menu para a home
    return Align(
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: _percentage,
        child: ListView(
          padding: EdgeInsets.only(top: 100, bottom: 50),
          children: [
            _menuItem("Home", Icons.home, () {
              setState(() {
                _selectedMenu = MENU_ITEM_HOME;
              });

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );

              _toggleMenu();
            }, MENU_ITEM_HOME),
            _menuItem("Calculadora", Icons.calculate, () {
              setState(() {
                _selectedMenu = MENU_ITEM_CALC;
              });

              //Get.to(SecondPage());

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalcPage()),
              );

              _toggleMenu();
            }, MENU_ITEM_CALC),
            _menuItem("Histórico", Icons.history, () {
              setState(() {
                _selectedMenu = MENU_ITEM_HIST;
              });

              //Get.to(SecondPage());

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );

              _toggleMenu();
            }, MENU_ITEM_HIST),
            SizedBox(
              height: _defaultPadding,
            ),
            _menuItem("Avaliar App", Icons.star_outline, () {
              _toggleMenu();
            }, MENU_ITEMAVALI),
          ],
        ),
      ),
    );
  }

  _toggleMenu() {
    setState(() {
      if (isCollapsed) {
        _selectedMenu = MENU_ITEM_HOME;
        _animationController.forward();
      } else {
        _animationController.reverse();
      }

      isCollapsed = !isCollapsed;
    });
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
            onTapCard: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalcPage()),
              );
            },
            child: Icon(Icons.calculate, size: 48, color: Colors.deepPurple)),
        CardBase(
          heigth: 100,
          width: 100,
          horizontalPadding: 15,
          verticalPadding: 15,
          onTapCard: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoryPage()),
            );
          },
          child: Icon(Icons.history, size: 48, color: Colors.deepPurple),
        ),
        CardBase(
          heigth: 100,
          width: 100,
          horizontalPadding: 15,
          verticalPadding: 15,
          onTapCard: () {
            //setState(() {
            //    _selectedMenu = MENU_ITEM_CALC;
            //  });

            //Get.to(SecondPage());

            // TODO: ir para avaliação do app
          },
          child: Icon(Icons.star_outline, size: 48, color: Colors.deepPurple),
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
