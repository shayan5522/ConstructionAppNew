import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewOccupiedOpeningSheetDocs extends StatelessWidget {
  final String projectId;
  final String docId;

  ViewOccupiedOpeningSheetDocs({
    required this.projectId,
    required this.docId,
  });

  String formatData(String? data) => data == null || data.isEmpty ? "Unknown" : data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Project Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent.shade700,
        elevation: 0,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('OccupiedData')
            .doc(projectId)
            .collection('Projects')
            .doc(docId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.tealAccent.shade700),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error fetching project data.',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          final projectData = snapshot.data?.data() as Map<String, dynamic>?;
          if (projectData == null) {
            return Center(
              child: Text(
                'No data available.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection('Project Information', [
                  _buildDetailRow('Project Name', formatData(projectData['projectName'])),
                  _buildDetailRow('Client Name', formatData(projectData['clientName'])),
                  _buildDetailRow('Principal Contractor', formatData(projectData['principalContractor'])),
                  _buildDetailRow('Contract', formatData(projectData['contract'])),
                  _buildDetailRow('Date', formatData(projectData['date'])),
                ]),
                SizedBox(height: 16),
                _buildSection('Readings', [
                  _buildDetailRow('Gas Reading', formatData(projectData['gasReading'])),
                  _buildDetailRow('Electric Reading', formatData(projectData['electricReading'])),
                  _buildDetailRow('Water Reading', formatData(projectData['waterReading'])),
                  _buildDetailRow('Gas Location', formatData(projectData['gasLocation'])),
                  _buildDetailRow('Electric Location', formatData(projectData['electricLocation'])),
                  _buildDetailRow('Water Location', formatData(projectData['waterLocation'])),
                ]),
                SizedBox(height: 16),
                _buildSection('Additional Details', [
                  _buildDetailRow('Steel Grills', formatData(projectData['steelGrills'])),
                  _buildDetailRow('PIR', formatData(projectData['pir'])),
                  _buildDetailRow('Asbestos Survey', formatData(projectData['asbestosSurvey'])),
                  _buildDetailRow('EPC Required', formatData(projectData['epcRequired'])),
                  _buildDetailRow('Target Program', formatData(projectData['targetProgram'])),
                ]),
                SizedBox(height: 16),
                _buildSection('Address & Locks', [
                  _buildDetailRow('Occupied Address', formatData(projectData['occupiedAddress'])),
                  _buildDetailRow('Front Door', formatData(projectData['frontDoor'])),
                  _buildDetailRow('Other Locks', formatData(projectData['otherLocks'])),
                ]),
                SizedBox(height: 16),
                if (projectData['photoPath'] != null && projectData['photoPath']!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      projectData['photoPath'],
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> content) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.tealAccent.shade700,
              ),
            ),
            SizedBox(height: 8),
            ...content,
          ],
        ),
      ),
    );
  }

  // Widget _buildDetailRow(String title, String value) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 4.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           title,
  //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //         ),
  //         Text(
  //           value,
  //           style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildDetailRow(String title, String value) {
    if (value == "Unknown") return SizedBox(); // Don't render if value is "Unknown"

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
