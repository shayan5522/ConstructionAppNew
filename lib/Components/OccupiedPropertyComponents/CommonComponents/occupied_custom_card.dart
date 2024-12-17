import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final List<String> options;
  final String selectedQuantity;
  final List<String> quantityOptions;
  final String selectedCost;
  final List<String> costOptions;
  final VoidCallback onAddNote;

  const CustomCard({
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: options
                        .map(
                          (option) => Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (val) {},
                            activeColor: Colors.black87,
                          ),
                          Text(option),
                          const SizedBox(width: 8),
                        ],
                      ),
                    )
                        .toList(),
                  ),
                  TextButton(
                    onPressed: onAddNote,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Add note +'),
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
    );
  }

  Widget buildDropdown(String label, String value, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
              items: options
                  .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
                  .toList(),
              onChanged: (val) {},
            ),
          ),
        ),
      ],
    );
  }
}
