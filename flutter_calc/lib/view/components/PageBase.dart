import 'package:flutter/material.dart';

@immutable
class PageBase extends StatelessWidget {
  final Widget child;

  PageBase({ @required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                0.2,
                0.9
              ],
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).backgroundColor,
                Theme.of(context).cardColor,
              ]),
        ),
        child: child);
  }
}
