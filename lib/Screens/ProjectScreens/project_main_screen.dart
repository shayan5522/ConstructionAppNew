import 'package:TotalSurvey/Screens/ProjectScreens/project_edit.dart';
import 'package:TotalSurvey/Screens/ProjectScreens/view_project_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/ProjectComponents/project_overview_card.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../Inspection/inspection.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  Future<List<Map<String, dynamic>>> fetchProjects() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final userDoc = await firestore.collection('users').doc(user.uid).get();
    final String firstName = userDoc.data()?['firstName'] ?? 'Unknown';

    // Debug log to check the first name
    print('User first name: $firstName');

    final snapshot = await firestore
        .collection('VoidProperty')
        .doc(firstName)
        .collection('Projects')
        .get();
    if (snapshot.docs.isEmpty) {
      print('No projects found.');
      return [];
    }

    return snapshot.docs.map((doc) {
      print('Document ID: ${doc.id}, Data: ${doc.data()}'); // Debug log
      return {
        ...doc.data(),
        'id': doc.id,
      };
    }).toList();
  }


  late Future<List<Map<String, dynamic>>> _projectsFuture;

  @override
  void initState() {
    super.initState();
    _projectsFuture = fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const ProjectOverviewComponent(),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Current Projects",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ProjectCardNew(
              projectTitle: "Project Beta",
              projectRef: "Ref#12345",
              statusText: "Pending",
              statusColor: const Color(0xFFFFC7C2),
              onEditPressed: () {},
              onContinuePressed: () {},
            ),
            ProjectCardNew(
              projectTitle: "Project Alfa",
              projectRef: "Ref#12345",
              statusText: "Completed",
              statusColor: const Color(0xFF17E7D0),
              onEditPressed: () {},
              onContinuePressed: () {},
            ),
            ProjectCardNew(
              projectTitle: "Project Alfa",
              projectRef: "Ref#12345",
              statusText: "In progress",
              statusColor: const Color(0xFFFFEB9E),
              onEditPressed: () {},
              onContinuePressed: () {},
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Void Property Projects",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _projectsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                final projects = snapshot.data ?? [];

                if (projects.isEmpty) {
                  return const Center(child: Text("No Void Property Projects found."));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    final projectId = project['id'];

                    return ProjectCardNew(
                      projectTitle: project['projectName'] ?? "Unnamed Project",
                      projectRef: project['uprn'] ?? "No reference",
                      statusText: project['status'] ?? "Unknown",
                      statusColor: const Color(0xFFFFC7C2),
                      onEditPressed: () {
                        print('Project ID before navigation: $projectId');
                        Get.to(() => EditProjectDetailsScreen(
                          projectId: "b7w5SwEGVmelWdEBLfti",
                          projectData: project,
                        ));
                      },

                      onContinuePressed: () {
                        Get.to(() =>  ViewProjectDetailsScreen());
                      },
                    );
                  },
                );
              },
            ),

          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            backgroundColor: Colors.tealAccent,
            onPressed: () {
              Get.to(const InspectionScreen());
            },
            label: const Row(
              children: [
                Icon(Icons.add, color: Colors.black),
                SizedBox(width: 8),
                CustomTextWidget(
                  text: 'Create Inspection',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            backgroundColor: Colors.white,
            onPressed: () {},
            label: const Row(
              children: [
                Icon(Icons.history, color: Colors.black),
                SizedBox(width: 8),
                CustomTextWidget(
                  text: 'View Past Projects',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCardNew extends StatelessWidget {
  final String projectTitle;
  final String projectRef;
  final String statusText;
  final Color statusColor;
  final VoidCallback onEditPressed;
  final VoidCallback onContinuePressed;

  const ProjectCardNew({
    Key? key,
    required this.projectTitle,
    required this.projectRef,
    required this.statusText,
    required this.statusColor,
    required this.onEditPressed,
    required this.onContinuePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projectTitle,
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: onEditPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.edit, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "Edit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              "UPRN# $projectRef",
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: onContinuePressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.teal,
                side: const BorderSide(color: Colors.teal),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("View Inspection"),
                  Icon(Icons.play_arrow, size: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
