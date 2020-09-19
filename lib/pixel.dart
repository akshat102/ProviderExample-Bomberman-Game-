import 'package:flutter/material.dart';

class Pixels extends StatelessWidget {
  final Color innerColor;
  final Color outerColor;
  final Widget child;
  Pixels({this.innerColor,this.outerColor, this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: outerColor,
        ),
        padding: EdgeInsets.all(6),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: innerColor,
            ),
            child: Center(child: child)),
      ),
    );;
  }
}
