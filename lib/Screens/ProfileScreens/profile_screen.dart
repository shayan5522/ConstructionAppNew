import 'package:TotalSurvey/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../CustomWidgets/custom_snackbar.dart';
import '../BottomBarScreens/home_screen.dart';
import '../../Controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController _profileController = Get.put(ProfileController());

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.off(() => const HomeScreen());
      customSnackBar(Get.context!, 'Success', 'Logged out successfully');
    } catch (e) {
      customSnackBar(Get.context!, 'Error', 'Failed to logout. Try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Profile"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Obx(() {
        if (_profileController.isLoading.value) {
          // Show loading indicator while fetching user data
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final userData = _profileController.userData.value;

        if (userData == null) {
          return const Center(
            child: Text("No user data available"),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // Circle Avatar for Profile Image
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/icons/app_logo.jpg'),
                ),
                const SizedBox(height: 20),
                // User Profile Information
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _profileDetailRow(
                          icon: Icons.person,
                          label: 'Name',
                          value: '${userData.firstName} ${userData.lastName}',
                        ),
                        const SizedBox(height: 10),
                        _profileDetailRow(
                          icon: Icons.email,
                          label: 'Email',
                          value: userData.email,
                        ),
                        const SizedBox(height: 10),
                        _profileDetailRow(
                          icon: Icons.transgender,
                          label: 'Gender',
                          value: userData.gender,
                        ),
                        const SizedBox(height: 10),
                        _profileDetailRow(
                          icon: Icons.calendar_today,
                          label: 'Age',
                          value: userData.age,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Logout Button
                ElevatedButton.icon(
                  onPressed: _logout,
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _profileDetailRow({required IconData icon, required String label, required String value}) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal),
        const SizedBox(width: 10),
        CustomTextWidget(
         text:  '$label: ',
          fontWeight: FontWeight.bold,
            fontSize: 16,
        ),
        Expanded(
          child: CustomTextWidget(
           text:  value,
              fontSize: 16,
              color: Colors.black54,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
