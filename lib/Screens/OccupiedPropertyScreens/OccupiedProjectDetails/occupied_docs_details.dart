import 'package:TotalSurvey/CustomWidgets/custom_text_widget.dart';
import 'package:TotalSurvey/Screens/OccupiedPropertyScreens/hallway_screen.dart';
import 'package:TotalSurvey/Screens/OccupiedPropertyScreens/kitchen_screen.dart';
import 'package:TotalSurvey/Screens/OccupiedPropertyScreens/opening_sheet_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OccupiedProjectDocs extends StatelessWidget {
  final String projectName;
  OccupiedProjectDocs({required this.projectName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: 'Sub Documents',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('OccupiedData')
            .doc(projectName)
            .collection('Projects')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching documents.'));
          }
          final documents = snapshot.data?.docs ?? [];
          final totalDocuments = documents.length;
          final status = totalDocuments < 8 ? "Pending" : "Completed";

          return Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.tealAccent.shade700, Colors.tealAccent.shade700],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: CustomTextWidget(
                  text: 'Status: $status',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
              if (totalDocuments < 8)
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      bool hasKitchen = documents.any((doc) => doc.id.toLowerCase() == 'kitchen');
                      bool hasOpeningSheet = documents.any((doc) => doc.id.toLowerCase() == 'opening sheet');
                      bool hasHallway = documents.any((doc) => doc.id.toLowerCase() == 'hallway');
                      bool lounge = documents.any((doc) => doc.id.toLowerCase() == 'kitchen');
                      bool bedroom1 = documents.any((doc) => doc.id.toLowerCase() == 'opening sheet');
                      bool bedroom2= documents.any((doc) => doc.id.toLowerCase() == 'hallway');
                      bool bedroom3 = documents.any((doc) => doc.id.toLowerCase() == 'kitchen');
                      bool bedroom4 = documents.any((doc) => doc.id.toLowerCase() == 'opening sheet');
                      bool mechanical = documents.any((doc) => doc.id.toLowerCase() == 'hallway');
                      bool electrical = documents.any((doc) => doc.id.toLowerCase() == 'hallway');

                      if (hasKitchen) {
                        Get.to(KitchenScreen());
                      } else if (hasOpeningSheet) {
                        Get.to(OpeningSheetScreen());
                      } else if (hasHallway) {
                        Get.to(HallwayScreen());
                      } else {
                        Get.snackbar('Error', 'No required documents found.');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: CustomTextWidget(
                      text: 'Continue Inspection',
                      color: Colors.white,
                    ),
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.tealAccent.shade100],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: document.id,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.tealAccent.shade700,
                            ),
                            SizedBox(height: 8),
                            CustomTextWidget(
                              text: 'Info: This is a description for ${document.id}',
                              fontSize: 14,
                              color: Colors.grey.shade800,
                            ),
                            SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.snackbar(
                                    'View Details',
                                    'Viewing details of ${document.id}',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.tealAccent.shade700,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'View Details',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
