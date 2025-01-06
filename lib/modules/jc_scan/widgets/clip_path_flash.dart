import 'package:flutter/cupertino.dart';

class ClipPathFlash extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    final path0 = Path()
      ..moveTo(w * 0.1, 0)
      ..cubicTo(w * 0.390, 0, w * 0.389, h * 0, w * 0.1881375, 0)
      ..cubicTo(
        w * 0.1527500,
        h * 0,
        w * 0,
        h * 0.1738714,
        w * 0.0015375,
        h * 0.4989857,
      )
      ..cubicTo(
        w * -0,
        h * 0.8222857,
        w * 0.1565625,
        h * 0.9929000,
        w * 0.1875000,
        h,
      )
      ..cubicTo(w * 0.3906250, h, w * 0.8227156, h, w, h)
      ..cubicTo(
        w * 0.8900375,
        h * 0.8105857,
        w * 0.8720375,
        h * 0.6808714,
        w * 0.8684375,
        h * 0.5010286,
      )
      ..cubicTo(
        w * 0.8727875,
        h * 0.3184571,
        w * 0.8911625,
        h * 0.1899000,
        w * 0.9981125,
        0,
      )
      ..close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
