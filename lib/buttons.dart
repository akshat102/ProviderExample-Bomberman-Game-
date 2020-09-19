import 'package:flutter/material.dart';
class Buttons extends StatelessWidget {
  Color color;
  Widget child;
  Buttons({this.color,this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        height: 70,
        width: 70,
        child: child,
      ),
    );
  }
}

