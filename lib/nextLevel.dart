import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColoredButton extends StatefulWidget {
  Function func;
  ColoredButton({this.func});
  @override
  _ColoredButtonState createState() => _ColoredButtonState();
}

class _ColoredButtonState extends State<ColoredButton>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  static final _sizeTween = new Tween<double>(begin: 1.5, end: 2.0);

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation.addStatusListener(listener);
  }

  void listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: animation, builder: builder);
  }

  Widget builder(BuildContext context, Widget child) {
    return Transform.scale(
      scale: _sizeTween.evaluate(animation),
      child: FlatButton(
        color: Color(0xff6495ed),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0),
            side: BorderSide(color: Color(0xff6495ed))),
        padding: EdgeInsets.all(2.0),
        child: Text(
          'Next Level',
          style: GoogleFonts.pacifico(),//TextStyle(fontSize: animation.value/7),
        ),
        onPressed: () {
          setState(() {
            controller.forward();
          });
          Future.delayed(Duration(milliseconds: 300), (){
            widget.func();
          });
        },
      ),
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
