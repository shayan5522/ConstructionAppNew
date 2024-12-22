import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import '../main_screen.dart';
import 'bedroom1_screen.dart';
import 'bedroom2_screen.dart';
import 'bedroom3_screen.dart';
import 'bedroom4_screen.dart';
import 'external_work_screen.dart';
import 'hallway_screen.dart';
import 'kitchen_screen.dart';
import 'lovenge_screen.dart';
import 'major_work_screen.dart';
import 'mechnical_work_screen.dart';
import 'opening_sheet_screen.dart';

class FinalScreen extends StatelessWidget {
  FinalScreen({super.key});
  final _openingSheetFormController = Get.put(OpeningSheetFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final Screen', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.to(MainScreen());
            },
            child: const Text('Save and Exit', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('OccupiedData')
            .doc(_openingSheetFormController.projectName.text)
            .collection('Projects')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching documents.'));
          }

          final documents = snapshot.data?.docs ?? [];
          final screens = {
            'kitchen screen': KitchenScreen(),
            'Lounge screen': LoungeScreen(),
            'Hallway screen': HallwayScreen(),
            'Bedroom 1': Bedroom1Screen(),
            'Bedroom 2': Bedroom2Screen(),
            'Bedroom 3': Bedroom3Screen(),
            'Bedroom 4': Bedroom4Screen(),
            'Mechanical screen': MechanicalElectricalScreen(),
            'External Screen': ExternalWorkScreen(),
            'Major work': MajorWorkScreen(),
          };

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final doc = documents[index];
              final data = doc.data() as Map<String, dynamic>;
              final screenName = doc.id.toLowerCase();

              if (screenName == 'major work') {
                // Handle Major Work Screen Specific Data
                final checkedProduceBy = data['Checked Produce By'] ?? 'N/A';
                final estimatedValue = data['Estimated Project Value'] ?? 'N/A';
                final checkedPoints = List<String>.from(data['checkedPoints'] ?? []);

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'Major Work Screen',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTextRow('Checked Produced By:', checkedProduceBy),
                              _buildTextRow('Estimated Project Value:', estimatedValue),
                              const SizedBox(height: 12),
                              const Text('Checked Points:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 8),
                              ...checkedPoints.map((point) => _buildCheckedPointRow(point)).toList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (screens.containsKey(screenName)) {
                // Handle other screens
                final checklistData = data['checklistData'] as List<dynamic>? ?? [];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Text(
                            screenName.toUpperCase(),
                            style: const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        checklistData.isNotEmpty
                            ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: checklistData.length,
                          itemBuilder: (context, i) {
                            final item = checklistData[i] as Map<String, dynamic>;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 2,
                                child: ListTile(
                                  leading: const Icon(Icons.check, color: Colors.green),
                                  title: Text(item['title'] ?? 'No Title', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                    'Cost: ${item['cost'] ?? 'N/A'}, Quantity: ${item['quantity'] ?? 'N/A'}, Currency: ${item['Currency'] ?? 'N/A'}, Selected: ${item['selectedRadio'] ?? 'N/A'}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                            : const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('No data available for this screen', style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink(); // Skip unknown screens
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildTextRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        '$title $value',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildCheckedPointRow(String point) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 8),
          Text(point, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
