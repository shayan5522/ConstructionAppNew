import 'package:TotalSurvey/BackendFunctions/OccupiedBackend/fetching_data_projects.dart';
import 'package:TotalSurvey/Components/ProjectComponents/occupied_projects_data_screen.dart';
import 'package:TotalSurvey/CustomWidgets/custom_snackbar.dart';
import 'package:TotalSurvey/Screens/OccupiedPropertyScreens/OccupiedProjectDetails/occupied_docs_details.dart';
import 'package:TotalSurvey/Screens/ProjectScreens/project_edit.dart';
import 'package:TotalSurvey/Screens/ProjectScreens/view_project_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../BackendFunctions/VoidBackend/fetch_projects.dart';
import '../../Components/ProjectComponents/project_overview_card.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../Inspection/inspection.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  late Future<List<Map<String, dynamic>>> _projectsFuture;
  final OccupiedProjectFetchingController _projectFetchingController =
      Get.put(OccupiedProjectFetchingController());

  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    _projectsFuture = fetchUserProjects();
    _projectFetchingController.fetchData();
  }

  Future<void> deleteProject({required projectId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('VoidProperty')
          .doc(user!.uid)
          .collection('Projects')
          .doc(projectId)
          .delete();
      customSnackBar(context, "Success", "Project deleted successfully!");

      setState(() {
        _projectsFuture = fetchUserProjects();
      });
    } catch (error) {
      customSnackBar(context, "Error", "Failed to delete project");
      print("Failed to delete project: $error");
    }
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
              child: CustomTextWidget(
                  text:"Current Projects",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
              ),
            ),
            const SizedBox(height: 15),
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _projectFetchingController.mainDocNames.length,
                itemBuilder: (context, index) {
                  return ProjectCardNew(
                      projectTitle: _projectFetchingController.mainDocNames[index],
                      projectRef: _projectFetchingController.mainDocNames[index],
                      statusText: '',
                      statusColor: Colors.green,
                      onEditPressed: (){},
                      onContinuePressed: (){
                        Get.to(OccupiedProjectDocs(projectName: _projectFetchingController.mainDocNames[index]));
                      },
                      onDeletePressed: (){},
                  );
                },
              );
            }),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomTextWidget(
                text: "Void Property Projects",
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
                  return const Center(
                      child: Text("No Void Property Projects found."));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    final projectId = project['projectId'];
                    return ProjectCardNew(
                      projectTitle: project['projectName'] ?? "Unnamed Project",
                      projectRef: project['UPRN'] ?? "No uprn",
                      statusText: project['status'] ?? "Unknown",
                      statusColor: const Color(0xFFFFC7C2),
                      onEditPressed: () {
                        Get.to(() => EditProjectDetailsScreen(
                              projectId: projectId,
                              projectData: project,
                            ));
                      },
                      onContinuePressed: () {
                        Get.to(() => ViewProjectDetailsScreen(
                              projectId: projectId,
                              projectData: project,
                            ));
                      },
                      onDeletePressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Delete Project",
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold)),
                              content: Text(
                                "Are you sure you want to delete this project?",
                                style: GoogleFonts.nunito(),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancel",
                                      style: TextStyle(color: Colors.grey)),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                    await deleteProject(projectId: projectId);
                                  },
                                  child: Text("Delete",
                                      style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            );
                          },
                        );
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
          // FloatingActionButton.extended(
          //   backgroundColor: Colors.white,
          //   onPressed: () {},
          //   label: const Row(
          //     children: [
          //       Icon(Icons.history, color: Colors.black),
          //       SizedBox(width: 8),
          //       CustomTextWidget(
          //         text: 'View Past Projects',
          //         fontSize: 14,
          //         fontWeight: FontWeight.w600,
          //         color: Colors.black,
          //       ),
          //     ],
          //   ),
          // ),
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
  final VoidCallback onDeletePressed;

  const ProjectCardNew({
    Key? key,
    required this.projectTitle,
    required this.projectRef,
    required this.statusText,
    required this.statusColor,
    required this.onEditPressed,
    required this.onContinuePressed,
    required this.onDeletePressed,
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
                    CustomTextWidget(
                      text: projectTitle,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: onEditPressed,
                      icon: Icon(Icons.edit,color: Colors.teal,),
                    ),
                    IconButton(onPressed: onDeletePressed,
                      icon: Icon(Icons.delete,color: Colors.red,),
                    ),
                  ],
                ),
              ],
            ),
            CustomTextWidget(
              text: "UPRN# $projectRef",
              fontSize: 14,
              color: Colors.grey.shade600,
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
                  CustomTextWidget(text: "View Inspection"),
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
