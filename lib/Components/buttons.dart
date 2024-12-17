import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double width;
  final double height;
  final double borderRadius;
  final Color? solidColor;
  final Gradient? gradient;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.width = 361.0,
    this.height = 50.0,
    this.borderRadius = 50.0,
    this.solidColor,
    this.gradient = const LinearGradient(
      colors: [
        Color(0xFF3EE2D3),
        Color(0xFFC8FFFA),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: solidColor,
            gradient: solidColor == null ? gradient : null,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: const [
              BoxShadow(
                color: Color(0xff009680),
                blurRadius: 1.0,
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: textStyle ??
                  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
