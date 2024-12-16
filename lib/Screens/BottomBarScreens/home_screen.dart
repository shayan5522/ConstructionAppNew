import 'package:constructionapp/Screens/ProjectScreens/project_main_screen.dart';
import 'package:flutter/material.dart';
import '../../CustomWidgets/custom_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          automaticallyImplyLeading: false,
          title: const CustomTextWidget(text: 'Construction App',fontSize: 20,),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {  },),
          ],
          elevation: 0,
          bottom: const TabBar(
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
        ),
        body: const TabBarView(
          children: [
            ProjectsScreen(),
            Center(child: Text("Inspections Tab Content")),
            Center(child: Text("Regulations Tab Content")),
            Center(child: Text("Settings Tab Content")),
            Center(child: Text("Help Tab Content")),
          ],
        ),
      ),
    );
  }
}