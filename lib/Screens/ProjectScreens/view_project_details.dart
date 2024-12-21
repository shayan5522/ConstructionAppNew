import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewProjectDetailsScreen extends StatelessWidget {
  final String projectId;
  final Map<String, dynamic> projectData;

  ViewProjectDetailsScreen({
    Key? key,
    required this.projectId,
    required this.projectData,
  }) : super(key: key);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> fetchProjectDetails() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Get.snackbar("Error", "User not logged in.");
      return null;
    }

    try {
      final documentSnapshot = await _firestore
          .collection('VoidProperty')
          .doc(user.uid)
          .collection('Projects')
          .doc(projectId)
          .get();

      if (documentSnapshot.exists) {
        return documentSnapshot.data();
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch project details: $e");
      return null;
    }
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
      body: FutureBuilder<Map<String, dynamic>?>(
        future: fetchProjectDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.teal));
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Failed to load data: ${snapshot.error}",
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text(
                "No project details available.",
                style: TextStyle(color: Colors.black54),
              ),
            );
          } else {
            final project = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 10,
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
                          project['projectName'] ?? "Unnamed Project",
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
                          _buildLargeImageContainer(project["imageUrls"][0]),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildSmallImageContainer(project["imageUrls"][1]),
                              _buildSmallImageContainer(project["imageUrls"][2]),
                            ],
                          ),
                          SizedBox(height: 10,),
                          _buildDetailRow(
                              Icons.numbers, "UPRN:", project['uprn']),
                          _buildDetailRow(Icons.location_on, "Address:",
                              project['address']),
                          _buildDetailRow(Icons.person, "Surveyor Name:",
                              project['surveyorName']),
                          _buildDetailRow(Icons.phone, "Contact Details:",
                              project['contactDetails']),
                          _buildDetailRow(Icons.business, "Property Manager:",
                              project['propertyManager']),
                          _buildDetailRow(Icons.home, "Property Type:",
                              project['propertyType']),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
  Widget _buildLargeImageContainer(String imagePath) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget _buildSmallImageContainer(String imagePath) {
    return Container(
      width: Get.width/2.6,
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
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
