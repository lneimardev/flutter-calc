import 'package:flutter/material.dart';
import 'package:flutter_calc/view/pages/SecondPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isCollapsed = false;
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

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
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
  }

  Widget _context() {
    return SafeArea(
        child: Material(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      type: MaterialType.card,
      color: Theme.of(context).backgroundColor,
      elevation: 15,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Conteúdo"),
          backgroundColor: Theme.of(context).cardColor,
          centerTitle: true,
          leading: IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
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
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: Theme.of(context).cardColor,
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
                ? Theme.of(context).cardColor
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
                  color: Colors.white,
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
            _menuItem("Segunda página", Icons.engineering, () {
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
