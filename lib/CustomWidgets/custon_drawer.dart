import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:constructionapp/Screens/BottomBarScreens/DrawerComponents/profile_screen.dart';
import 'package:constructionapp/Screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Screens/BottomBarScreens/home_screen.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SizedBox(),
          ),
          DrawerItem(icon: Icons.home, title: 'Home',onPressed: (){
            Get.off(MainScreen());
          },),
          DrawerItem(icon: Icons.add_task, title: 'New Inspection',onPressed: (){
            Get.to(const ProfileScreen());
          },),

          DrawerItem(icon: Icons.pending_actions, title: 'Pending Inspections',onPressed: (){},),
          DrawerItem(icon: Icons.incomplete_circle, title: 'In Progress',onPressed: (){},),
          DrawerItem(icon: Icons.check_circle_outline, title: 'Completed',onPressed: (){},),
          DrawerItem(icon: Icons.settings, title: 'Settings',onPressed: (){},),
          DrawerItem(icon: Icons.help_outline, title: 'Help',onPressed: (){},),
          const SizedBox(height: 20), // Spacing
          ListTile(
            tileColor: Colors.grey[200],
            leading: const Icon(Icons.description),
            title: const CustomTextWidget(
            text:   'View Reports',
             fontWeight: FontWeight.bold,
            ),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  const DrawerItem({super.key, required this.icon, required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onPressed,
    );
  }
}
