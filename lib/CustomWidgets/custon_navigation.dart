import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Screens/ProfileScreens/login_screen.dart';
import '../Screens/ProfileScreens/profile_screen.dart';
import '../Screens/ProfileScreens/register.dart';

class NavigationHelper {
  static Future<void> handleProfileNavigation(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Get.to(() => ProfileScreen());
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text("Account Required"),
          content: const Text(
              "You need an account to access the profile. Do you want to log in or sign up?"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.to(() => const LoginScreen());
              },
              child: const Text("Log In"),
            ),
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
                Get.to(() => const SignupScreen()); // Navigate to SignupScreen
              },
              child: const Text("Sign Up"),
            ),
          ],
        ),
      );
    }
  }
}
