import 'package:flutter/material.dart';

class CardBase extends StatelessWidget {
  //static const double PADDING_HORIZONTAL = 15;

  final Widget child;
  final double heigth;
  final double width;
  final double horizontalPadding;
  final double verticalPadding;
  final Color backgroundColor;
  final Function onTapCard;

  CardBase(
      {this.child,
      this.heigth,
      this.width,
      this.horizontalPadding,
      this.verticalPadding,
      this.backgroundColor,
      this.onTapCard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding != null ? horizontalPadding : 20,
          vertical: verticalPadding != null ? verticalPadding : 20),
      // The Align ideal here, it`s because every view needs a x and y point to draw his heigth and width
      // Otherwise will not respect these params
      child: Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: backgroundColor != null
                ? backgroundColor
                : Theme.of(context).cardColor,
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: this.onTapCard ?? () {},
              child: Container(
                  height: heigth,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: child),
            ),
          )),
    );
  }
}
