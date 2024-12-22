import 'package:TotalSurvey/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewMajorWorkDetailsScreen extends StatelessWidget {
  final String docId;
  final String projectId;

  ViewMajorWorkDetailsScreen({required this.docId,required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: 'Occupied Details',color: Colors.white),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: true,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('OccupiedData')
            .doc(projectId)
            .collection('Projects')
            .doc(docId)
            .get()
            .asStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching details.'));
          }
          if (!snapshot.data!.exists) {
            return const Center(child: Text('No data available.'));
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;
          final screenName = data['screenName'] ?? 'Unknown Screen';
          final images = List<String>.from(data['images'] ?? []);
          final details = data['details'] ?? 'No details available.';
          final checkedPoints = List<String>.from(data['checkedPoints'] ?? []);
          final checkedProduceBy = data['Checked Produce By'] ?? 'N/A';
          final estimatedValue = data['Estimated Project Value'] ?? 'N/A';

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildScreenTitle(screenName),
                const SizedBox(height: 16),
                if (images.isNotEmpty) _buildImageCarousel(images),
                const SizedBox(height: 16),
                _buildTextRow('Checked Produced By:', checkedProduceBy),
                _buildTextRow('Estimated Project Value:', estimatedValue),
                const SizedBox(height: 16),
                const Text('Checked Points:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...checkedPoints.map((point) => _buildChecklistPoint(point)).toList(),
                const SizedBox(height: 16),
                _buildTextRow('Details:', details),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildScreenTitle(String title) {
    return CustomTextWidget(
      text:  title,
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo,
    );
  }

  Widget _buildImageCarousel(List<String> images) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                images[index],
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: '$label ',
            fontSize: 18, fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: CustomTextWidget(
              text:  value,
              fontSize: 16, color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistPoint(String point) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 8),
          Text(
            point,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
