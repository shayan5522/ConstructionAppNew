import 'package:constructionapp/Screens/Setting/help.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Components/buttons.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableMenuItem(
              icon: Icons.add_circle_outline,
              text: 'New Inspection',
              onTap: () {
              },
            ),
            ReusableMenuItem(
              icon: Icons.flag,
              text: 'Pending Inspections',
              onTap: () {
              },
            ),
            ReusableMenuItem(
              icon: Icons.timelapse,
              text: 'In Progress',
              onTap: () {
              },
            ),
            ReusableMenuItem(
              icon: Icons.check_circle_outline,
              text: 'Completed',
              onTap: () {
              },
            ),
            const Spacer(),
            CustomButton(
              text: 'View Reports',
              solidColor: Colors.white,
              onPressed: () {  },
            )
          ],
        ),
      ),
    );
  }
}

class ReusableMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ReusableMenuItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.black),
      title: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}