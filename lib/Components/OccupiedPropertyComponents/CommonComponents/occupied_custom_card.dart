import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../CustomWidgets/custom_elevated_button.dart';
import '../../../CustomWidgets/custom_text_widget.dart';

class CustomOccupiedCard extends StatelessWidget {
  final String title;
  final List<Widget> options;
  final RxString selectedQuantity;
  final List<String> quantityOptions;
  final RxString selectedCost;
  final List<String> costOptions;
  final VoidCallback onAddNote;

  const CustomOccupiedCard({
    super.key,
    required this.title,
    required this.options,
    required this.selectedQuantity,
    required this.quantityOptions,
    required this.selectedCost,
    required this.costOptions,
    required this.onAddNote,
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
                        buildDropdown('Quantity', selectedQuantity, quantityOptions),
                        const SizedBox(height: 12),
                        buildDropdown('Cost', selectedCost, costOptions),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 10,
                left: 15,
                child: CustomElevatedButton(
                  text: 'Add Note',
                  fontSize: 10,
                  icon: Icons.add,
                  backgroundColor: Colors.teal,
                  width: 112,
                  height: 40,
                  onPressed: onAddNote,
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String label, RxString value, List<String> options) {
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
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: Obx(() {
              return DropdownButton<String>(
                value: value.value, // Reactive value
                isDense: true,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                items: options.map((item) => DropdownMenuItem(
                  value: item,
                  child: CustomTextWidget(text: item),
                )).toList(),
                onChanged: (val) {
                  if (val != null) {
                    value.value = val;
                  }
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}

