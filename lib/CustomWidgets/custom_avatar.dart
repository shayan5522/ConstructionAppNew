import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final Color borderColor;
  final double borderWidth;
  final IconData? icon;
  final Color? iconColor;
  final double iconSize;

  const CustomAvatar({
    Key? key,
    required this.imageUrl,
    this.radius = 50.0,
    this.borderColor = Colors.blue,
    this.borderWidth = 2.0,
    this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: borderColor,
          child: CircleAvatar(
            radius: radius - borderWidth,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        if (icon != null)
          CircleAvatar(
            radius: iconSize / 2 + 4,
            backgroundColor: Colors.blue,
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
      ],
    );
  }
}
