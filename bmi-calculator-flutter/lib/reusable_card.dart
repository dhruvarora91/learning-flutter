import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.colorChoice, this.cardChild, this.onPress});
  final Color colorChoice;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colorChoice,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
