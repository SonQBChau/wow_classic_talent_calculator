import 'package:flutter/material.dart';

class CustomPageTransition extends PageRouteBuilder {
  final Widget widget;
  CustomPageTransition({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        });
}
