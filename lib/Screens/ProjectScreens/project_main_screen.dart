import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/ProjectComponents/project_overview_card.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../Inspection/inspection.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
            ),),
            const SizedBox(height: 10),
            ProjectCardNew(
                projectTitle: "Project Beta",
                projectRef: "Ref#12345",
                statusText: "Pending",
                statusColor: const Color(0xFFFFC7C2),
                onEditPressed: (){},
                onContinuePressed: (){}
            ),
            ProjectCardNew(
                projectTitle: "Project Alfa",
                projectRef: "Ref#12345",
                statusText: "Completed",
                statusColor: const Color(0xFF17E7D0),
                onEditPressed: (){},
                onContinuePressed: (){}
            ),
            ProjectCardNew(
                projectTitle: "Project Alfa",
                projectRef: "Ref#12345",
                statusText: "In progress",
                statusColor: const Color(0xFFFFEB9E),
                onEditPressed: (){},
                onContinuePressed: (){}
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
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
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
                    const SizedBox(height: 4),
                  ],
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    statusText,
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: statusColor,
                    ),
                  ),
                ),
                // Edit Button
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
            const SizedBox(height: 8),

            // Reference Number
            Text(
              "Ref# $projectRef",
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 12),

            // Continue Inspection Button
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
                  Text("Continue Inspection"),
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
