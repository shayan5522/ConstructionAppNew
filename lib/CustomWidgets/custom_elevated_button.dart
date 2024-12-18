import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final EdgeInsets padding;
  final double? height;
  final double? width;
  final IconData? icon;
  final double iconSize;
  final Color? iconColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.height,
    this.width,
    this.icon,
    this.iconSize = 20.0,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextWidget(
              text:  text,
              fontSize: fontSize,
              color: textColor,
            ),
            const SizedBox(width: 5,),
            if (icon != null) ...[
              Icon(
                icon,
                size: iconSize,
                color: iconColor ?? textColor,
              ),
              const SizedBox(width: 8.0),
            ],
          ],
        ),
      ),
    );
  }
}
