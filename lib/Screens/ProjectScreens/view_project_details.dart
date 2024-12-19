import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewProjectDetailsScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ViewProjectDetailsScreen({Key? key}) : super(key: key);

  Future<List<Map<String, dynamic>>> fetchProjectDetails() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Get.snackbar("Error", "User not logged in.");
      return [];
    }

    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    final String firstName = userDoc.data()?['firstName'] ?? 'Unknown';

    final querySnapshot = await _firestore
        .collection('VoidProperty')
        .doc(firstName)
        .collection('Projects')
        .get();

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.teal.shade800,
        foregroundColor: Colors.white,
        title: Text(
          "Project Details",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchProjectDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Failed to load data: ${snapshot.error}",
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No project details available.", style: TextStyle(color: Colors.white)),
            );
          } else if (snapshot.hasData) {
            final projectDetails = snapshot.data!;
            return ListView.builder(
              itemCount: projectDetails.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemBuilder: (context, index) {
                final project = projectDetails[index];
                return Card(
                  elevation: 10,
                  margin: const EdgeInsets.only(bottom: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade600,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            project['projectName'] ?? "Project",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDetailRow(Icons.numbers, "UPRN:", project['uprn']),
                            _buildDetailRow(Icons.location_on, "Address:", project['address']),
                            _buildDetailRow(Icons.person, "Surveyor Name:", project['surveyorName']),
                            _buildDetailRow(Icons.phone, "Contact Details:", project['contactDetails']),
                            _buildDetailRow(Icons.business, "Property Manager:", project['propertyManager']),
                            _buildDetailRow(Icons.home, "Property Type:", project['propertyType']),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Unexpected error occurred."));
          }
        },
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.teal.shade800, size: 20),
          const SizedBox(width: 8),
          Text(
            "$label ",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Text(
              value ?? "N/A",
              style: GoogleFonts.lato(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
