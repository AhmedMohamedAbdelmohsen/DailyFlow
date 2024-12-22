import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircularBorderIconButton extends StatelessWidget {
  final String iconAsset;
  final VoidCallback onPressed;
  final Color borderColor;
  final double borderWidth;
  final double iconSize;
  final Color iconColor;

  const CircularBorderIconButton({
    Key? key,
    required this.iconAsset,
    required this.onPressed,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    this.iconSize = 24.0,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          iconAsset,
          height: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
