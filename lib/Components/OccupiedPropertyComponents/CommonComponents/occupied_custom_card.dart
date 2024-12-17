import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomOccupiedCard extends StatelessWidget {
  final String title;
  final List<Widget> options;
  final String selectedQuantity;
  final List<String> quantityOptions;
  final String selectedCost;
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
                           text:  title,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: options,
                          ),
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
              bottom: 0,
              left: 15,
              child: TextButton(
                onPressed: onAddNote,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const CustomTextWidget(text: 'Add note +',color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String label, String value, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
         text:  label, fontWeight: FontWeight.bold, fontSize: 12,
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
            child: DropdownButton<String>(
              value: value,
              isDense: true,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              items: options.map((item) => DropdownMenuItem(
                value: item,
                child: CustomTextWidget(text: item),
              )).toList(),
              onChanged: (val) {},
            ),
          ),
        ),
      ],
    );
  }
}
