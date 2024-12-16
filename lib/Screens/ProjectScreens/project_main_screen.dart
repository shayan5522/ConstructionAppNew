import 'package:constructionapp/Components/ProjectComponents/project_overview_card.dart';
import 'package:constructionapp/Components/ProjectComponents/survey_screen.dart';
import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            ProjectCard(
              title: "Project Alpha",
              status: "In progress",
              onEdit: () {},
            ),
            ProjectCard(
              title: "Project Beta",
              status: "Completed",
              onEdit: () {},
            ),
            ProjectCard(
              title: "Project Gamma",
              status: "Pending",
              onEdit: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.tealAccent,
        onPressed: () {
          Get.to(const SurveyPage());
        },
        label: const Row(
          children: [
            Icon(Icons.add,color: Colors.black12,),
            SizedBox(width: 8),
            CustomTextWidget(
              text: 'Create Inspection',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}


class ProjectCard extends StatelessWidget {
  final String title;
  final String status;
  final VoidCallback onEdit;

  const ProjectCard({
    super.key,
    required this.title,
    required this.status,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(text: title, fontSize: 18, fontWeight: FontWeight.bold),
                CustomTextWidget(text: status, color: Colors.grey),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
            ),
          ],
        ),
      ),
    );
  }
}
