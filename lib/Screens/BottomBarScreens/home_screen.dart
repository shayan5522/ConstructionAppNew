import 'package:TotalSurvey/CustomWidgets/custon_navigation.dart';
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
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                      onPressed: () => NavigationHelper.handleProfileNavigation(context),
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
                  icon: Icon(Icons.swap_horiz, size: 28),
                  text: "Regulations",
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
                  Center(child: Text("Regulations Tab Content")),
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
