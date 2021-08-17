import 'package:flutter/material.dart';
import 'package:flutter_calc/view/components/PageBase.dart';

@immutable
class PageBaseWithScaffold extends StatelessWidget {
  final Widget child;
  final String title;

  PageBaseWithScaffold({@required this.child, @required this.title});

  @override
  Widget build(BuildContext context) {
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
                    title: Text(this.title,
                        style: Theme.of(context).textTheme.headline3),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    centerTitle: true,
                    elevation: 0,
                    iconTheme: Theme.of(context).iconTheme,
                  ),
                  body: PageBase(child: this.child)))),
    );
  }
}
