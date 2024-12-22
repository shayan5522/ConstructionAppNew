import 'package:TotalSurvey/CustomDialogs/custom_dialogue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Inspection/inspection.dart';
import '../ProfileScreens/login_screen.dart';
import '../ProfileScreens/profile_screen.dart';
import '../ProfileScreens/register.dart';
import '../ProjectScreens/project_main_screen.dart';
import '../Setting/help.dart';
import '../Setting/setting.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.tealAccent, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "TOTAL SURVEY",
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.green.shade200,
                    radius: 18,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      color: Colors.white,
                      onPressed: (){
                        if (user != null) {
                        Get.to(() => ProfileScreen());
                        } else {
                          Get.dialog(
                            CustomDialog(
                                title: 'Account Required',
                                message: "You need an account to access the profile. Do you want to log in or sign up?",
                                loginButtonText: 'Login',
                                signupButtonText: 'SignUp',
                                onLogin: (){
                                  Get.to(() => const LoginScreen());
                                },
                                onSignup: (){
                                  Get.to(() => const SignupScreen());
                                }
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.person),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const TabBar(
              indicatorColor: Colors.teal,
              labelColor: Colors.teal,
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  icon: Icon(Icons.folder_open_outlined, size: 28),
                  text: "Projects",
                ),
                Tab(
                  icon: Icon(Icons.map_outlined, size: 28),
                  text: "Inspections",
                ),
                Tab(
                  icon: Icon(Icons.settings_outlined, size: 28),
                  text: "Settings",
                ),
                Tab(
                  icon: Icon(Icons.help_outline, size: 28),
                  text: "Help",
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ProjectsScreen(),
                  InspectionScreen(),
                  SettingScreen(),
                  HelpScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
