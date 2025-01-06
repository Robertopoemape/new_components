import 'package:flutter/cupertino.dart';

class ClipPathWifi extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    final path0 = Path()
      ..moveTo(w * 0.7545000, 0)
      ..cubicTo(
        w * 0.8739125,
        h * 0.0468857,
        w * 0.9916625,
        h * 0.1465714,
        w,
        h * 0.5013571,
      )
      ..cubicTo(
        w * 0.9934375,
        h * 0.8252143,
        w * 0.8698500,
        h * 0.9685857,
        w * 0.7493375,
        h,
      )
      ..quadraticBezierTo(w * 0.5620031, h, 0, h)
      ..quadraticBezierTo(
        w * 0.0509625,
        h * 0.9318429,
        w * 0.0735875,
        h * 0.8728714,
      )
      ..cubicTo(
        w * 0.1215875,
        h * 0.7640286,
        w * 0.1477875,
        h * 0.6057429,
        w * 0.1472375,
        h * 0.4981571,
      )
      ..cubicTo(
        w * 0.1498625,
        h * 0.3979286,
        w * 0.1216000,
        h * 0.2432857,
        w * 0.0796750,
        h * 0.1349857,
      )
      ..quadraticBezierTo(w * 0.0507375, h * 0.0677286, w * 0.0005125, 0)
      ..quadraticBezierTo(w * 0.7416875, h * -0.0002857, w * 0.7545000, 0)
      ..close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
