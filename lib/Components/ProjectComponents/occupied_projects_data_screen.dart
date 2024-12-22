import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../BackendFunctions/OccupiedBackend/fetching_data_projects.dart';

class OccupiedProjectsDataScreen extends StatelessWidget {
  final OccupiedProjectFetchingController _controller = Get.put(OccupiedProjectFetchingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<DocumentSnapshot>>(
        stream: _controller.fetchUserDocs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !(snapshot.hasData) || snapshot.data!.isEmpty) {
            return const Center(child: Text('No projects found.'));
          }

          final docs = snapshot.data!;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final docId = docs[index].id;

              return StreamBuilder<List<Map<String, dynamic>>>( // Fetching sub-documents
                stream: _controller.fetchSubDocs(docId),
                builder: (context, subSnapshot) {
                  if (subSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (subSnapshot.hasError || !(subSnapshot.hasData) || subSnapshot.data!.isEmpty) {
                    return const Center(child: Text('No sub-documents found.'));
                  }

                  final subDocs = subSnapshot.data!;
                  final int subDocCount = subDocs.length; // Storing sub-documents count

                  return ExpansionTile(
                    title: Text('Project: $docId ($subDocCount sub-docs)'),
                    children: subDocs.map((subDoc) {
                      return ProjectCardNew(
                        projectTitle: subDoc['title'] ?? 'Unnamed Project',
                        projectRef: subDoc['ref'] ?? 'No Reference',
                        statusText: subDoc['status'] ?? 'Unknown',
                        statusColor: Colors.green,
                        onEditPressed: () {},
                        onContinuePressed: () {},
                      );
                    }).toList(),
                  );
                },
              );
            },
          );
        },
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
    required this.projectTitle,
    required this.projectRef,
    required this.statusText,
    required this.statusColor,
    required this.onEditPressed,
    required this.onContinuePressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(projectTitle),
        subtitle: Text(projectRef),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(statusText, style: TextStyle(color: statusColor)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: const Icon(Icons.edit), onPressed: onEditPressed),
                IconButton(icon: const Icon(Icons.arrow_forward), onPressed: onContinuePressed),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
