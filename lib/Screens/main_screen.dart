import 'package:constructionapp/Screens/BottomBarScreens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/bottom_bar_controller.dart';
import 'BottomBarScreens/home_screen.dart';

class MainScreen extends StatelessWidget {
  final BottomNavController navController = Get.put(BottomNavController());
  final List<Widget> pages = [
    const NotificationScreen(),
    const HomeScreen(),
    const Center(child: Text('Back Screen', style: TextStyle(fontSize: 20))),
  ]; MainScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => pages[navController.currentIndex.value]),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: navController.currentIndex.value,
          onTap: navController.changeIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: _buildNavIcon(
                icon: Icons.notifications,
                index: 0,
                navController: navController,
              ),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(
                icon: Icons.home,
                index: 1,
                navController: navController,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(
                icon: Icons.arrow_back,
                index: 2,
                navController: navController,
              ),
              label: 'Back',
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildNavIcon({
    required IconData icon,
    required int index,
    required BottomNavController navController,
  }) {
    final bool isSelected = navController.currentIndex.value == index;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.green : Colors.transparent,
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.grey,
        size: 28,
      ),
    );
  }
}
