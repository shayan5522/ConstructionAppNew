import 'package:TotalSurvey/CustomWidgets/custom_snackbar.dart';
import 'package:TotalSurvey/CustomWidgets/custom_text_widget.dart';
import 'package:TotalSurvey/Screens/OccupiedPropertyScreens/external_work_screen.dart';
import 'package:TotalSurvey/Screens/OccupiedPropertyScreens/hallway_screen.dart';
import 'package:TotalSurvey/Screens/OccupiedPropertyScreens/kitchen_screen.dart';
import 'package:TotalSurvey/Screens/OccupiedPropertyScreens/mechnical_work_screen.dart';
import 'package:TotalSurvey/Screens/OccupiedPropertyScreens/opening_sheet_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bedroom1_screen.dart';
import '../bedroom2_screen.dart';
import '../bedroom3_screen.dart';
import '../bedroom4_screen.dart';
import '../lovenge_screen.dart';
import '../major_work_screen.dart';

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
          final status = totalDocuments < 11 ? "Pending" : "Completed";

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
              if (totalDocuments < 11)
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      final screens = {
                        'opening sheet': OpeningSheetScreen(),
                        'kitchen screen': KitchenScreen(),
                        'lounge screen': LoungeScreen(),
                        'hallway screen': HallwayScreen(),
                        'bedroom 1': Bedroom1Screen(),
                        'bedroom 2': Bedroom2Screen(),
                        'bedroom 3': Bedroom3Screen(),
                        'bedroom 4': Bedroom4Screen(),
                        'mechanical screen': MechanicalElectricalScreen(),
                        'External Screen': ExternalWorkScreen(),
                        'major work': MajorWorkScreen(),
                      };

                      for (var doc in screens.keys) {
                        if (!documents.any((document) => document.id.toLowerCase() == doc)) {
                          Get.to(screens[doc]);
                          return;
                        }
                      }
                      customSnackBar(context, 'Success', 'All Inspections Completed');
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
