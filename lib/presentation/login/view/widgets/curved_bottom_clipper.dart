import 'package:daily_flow/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CurvedBottomClipper extends StatelessWidget {
  final double endPointDeeperDrop;
  final Color color;
  final double height;

  const CurvedBottomClipper({
    Key? key,
    required this.endPointDeeperDrop,
    required this.color,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CustomCurvedClipper(endPointDeeperDrop: endPointDeeperDrop),
      child: Container(
        width: double.infinity,
        height: height,
        color: color,
      ),
    );
  }
}

class _CustomCurvedClipper  extends CustomClipper<Path> {
  final double endPointDeeperDrop;

  _CustomCurvedClipper ({required this.endPointDeeperDrop});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(AppSize.s0, size.height - endPointDeeperDrop);
    path.quadraticBezierTo(
      size.width / AppSize.s2,
      size.height - AppSize.s100,
      size.width,
      size.height - endPointDeeperDrop,
    );
    path.lineTo(size.width, AppSize.s0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
