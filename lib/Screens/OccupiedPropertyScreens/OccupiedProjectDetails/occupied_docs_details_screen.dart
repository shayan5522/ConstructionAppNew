import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:TotalSurvey/CustomWidgets/custom_text_widget.dart';

class ViewOccupiedDetailsScreen extends StatelessWidget {
  final String docId;
  final String projectId;

  ViewOccupiedDetailsScreen({required this.docId, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: 'Project Details',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching details.'));
          }

          final documentData = snapshot.data?.data() as Map<String, dynamic>?;

          if (documentData == null) {
            return Center(child: Text('No Data Available'));
          }

          // Extracting values from the document
          List<dynamic> imageUrls = documentData['ImageUrls'] ?? [];
          List<dynamic> checklistData = documentData['checklistData'] ?? [];
          String currency = documentData['Currency'] ?? 'Euro';
          String totalCost = documentData['totalCost']?.toString() ?? '0';

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Images Section
                  if (imageUrls.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Images:',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        SizedBox(height: 8),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: imageUrls.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                imageUrls[index],
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                      ],
                    ),

                  // Checklist Data Section
                  if (checklistData.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Checklist Data:',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: checklistData.length,
                          itemBuilder: (context, index) {
                            final checklistItem = checklistData[index];
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: checklistItem['title'] ?? 'No Title',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    SizedBox(height: 8),
                                    CustomTextWidget(
                                      text: 'Cost: $currency ${checklistItem['cost']}',
                                      fontSize: 14,
                                    ),
                                    CustomTextWidget(
                                      text: 'Quantity: ${checklistItem['quantity']}',
                                      fontSize: 14,
                                    ),
                                    CustomTextWidget(
                                      text: 'Selected: ${checklistItem['selectedRadio']}',
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                      ],
                    ),

                  // Total Cost Section
                  if (totalCost.isNotEmpty)
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.tealAccent.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            text: 'Total Cost:',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          CustomTextWidget(
                            text: '$currency $totalCost',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
