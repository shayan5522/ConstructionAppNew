import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OccupiedForm3 extends StatelessWidget {
  const OccupiedForm3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(
          text:  'Services',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        Card(
          color: const Color(0xFFF5F8F3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                buildServiceSection('Electric', 'kWh'),
                const SizedBox(height: 20),
                buildServiceSection('Gas', 'm³'),
                const SizedBox(height: 20),
                buildServiceSection('Water', 'liters'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildServiceSection(String title, String unit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
         text:  title,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        const CustomTextWidget(
         text: 'Location',
         fontSize: 12, color: Colors.black54,
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter location e.g service room',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        const CustomTextWidget(
          text: 'Readings',
          fontSize: 12, color: Colors.black54,
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: unit,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
