import 'package:flutter/material.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String label;
  final ValueChanged<T?> onChanged;
  final Color activeColor;
  final TextStyle labelStyle;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
    this.activeColor = Colors.blue,
    this.labelStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 19,
            height: 19,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: isSelected ? activeColor : Colors.grey, width: 2),
              color: isSelected ? activeColor : Colors.transparent,
            ),
            child: isSelected ? Center(child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ) : null,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: labelStyle.copyWith(
              color: isSelected ? activeColor : Colors.black87,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
