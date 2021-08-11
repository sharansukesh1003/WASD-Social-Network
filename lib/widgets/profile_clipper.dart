import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5); //// Create start line
    Offset curvePoint =
        Offset(size.width / 2, size.height); //// Creating points
    Offset endPoint =
        Offset(size.width, 4 * size.height / 5); //// Creating points
    path.quadraticBezierTo(
        curvePoint.dx, curvePoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0); //// Create end line
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
