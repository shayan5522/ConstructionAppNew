import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final EdgeInsets padding;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
