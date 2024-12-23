import 'package:TotalSurvey/CustomWidgets/custom_snackbar.dart';
import 'package:TotalSurvey/Screens/ProfileScreens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../BackendFunctions/OccupiedBackend/fetching_data_projects.dart';
import '../BackendFunctions/Other/occupied_counter_backend.dart';
import '../Controllers/bottom_bar_controller.dart';
import 'BottomBarScreens/home_screen.dart';
import 'BottomBarScreens/notifications_screen.dart';

class MainScreen extends StatefulWidget {

  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final BottomNavController navController = Get.put(BottomNavController());
  final DocumentController documentController = Get.put(DocumentController());
  User? user = FirebaseAuth.instance.currentUser;
  final OccupiedProjectFetchingController _projectFetchingController =
  Get.put(OccupiedProjectFetchingController());

  final List<Widget> pages = [
    const NotificationScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    documentController.fetchDocuments();
    _projectFetchingController.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => pages[navController.currentIndex.value]),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: navController.currentIndex.value,
          onTap: (index) {
            if (index == 2 && user == null) {
              customSnackBar(
                context,
                "Access Denied",
                "You must be logged in to access the Profile screen.",
              );
              return;
            }
            navController.changeIndex(index);
          },
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
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(
                icon: Icons.person,
                index: 2,
                navController: navController,
              ),
              label: 'Profile',
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
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isSelected
            ? const LinearGradient(
          colors: [Color(0xFF6FE9D9), Color(0xFF4CC3B8)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
            : null,
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(
          child: Icon(
            icon,
            color: isSelected ? const Color(0xFF4CC3B8) : Colors.grey,
            size: 28,
          ),
        ),
      ),
    );
  }
}

