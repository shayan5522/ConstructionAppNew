import 'package:flutter/material.dart';
import '../../../CustomWidgets/custom_text_widget.dart';

class CustomOccupiedCard extends StatelessWidget {
  final String title;
  final List<Widget> options;
  final TextEditingController quantityController;
  final TextEditingController costController;
  final Icon? prefixIcon;
  final Widget? quantityIcon;
  final Widget? noteArea;
  const CustomOccupiedCard({
    super.key,
    required this.title,
    required this.options,
    required this.quantityController,
    required this.costController,
    this.noteArea,
    this.prefixIcon,
    this.quantityIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 170,
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: title,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            children: options,
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildTextFormField('Quantity', quantityController,this.quantityIcon),
                        const SizedBox(height: 12),
                        buildTextFormField('Cost', costController,this.prefixIcon),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 10,
                left: 15,
                child: noteArea!,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField(String label, TextEditingController controller ,Widget? prefixIcon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: label,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        const SizedBox(height: 4),
        Container(
          height: 40,
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            decoration:  InputDecoration(
              prefixIcon:prefixIcon != null ? prefixIcon : quantityIcon,
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
