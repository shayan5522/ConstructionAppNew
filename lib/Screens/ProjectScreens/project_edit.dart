import 'package:TotalSurvey/CustomWidgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProjectDetailsScreen extends StatefulWidget {
  final String projectId;
  final Map<String, dynamic> projectData;

  const EditProjectDetailsScreen({
    Key? key,
    required this.projectId,
    required this.projectData,
  }) : super(key: key);

  @override
  _EditProjectDetailsScreenState createState() =>
      _EditProjectDetailsScreenState();
}

class _EditProjectDetailsScreenState extends State<EditProjectDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // TextEditingControllers for editing project details.
  late TextEditingController _projectNameController;
  late TextEditingController _uprnController;
  late TextEditingController _addressController;
  late TextEditingController _surveyorNameController;
  late TextEditingController _contactDetailsController;
  late TextEditingController _propertyManagerController;
  late TextEditingController _propertyTypeController;

  @override
  void initState() {
    super.initState();
    _projectNameController =
        TextEditingController(text: widget.projectData['projectName']);
    _uprnController = TextEditingController(text: widget.projectData['uprn']);
    _addressController =
        TextEditingController(text: widget.projectData['address']);
    _surveyorNameController =
        TextEditingController(text: widget.projectData['surveyorName']);
    _contactDetailsController =
        TextEditingController(text: widget.projectData['contactDetails']);
    _propertyManagerController =
        TextEditingController(text: widget.projectData['propertyManager']);
    _propertyTypeController =
        TextEditingController(text: widget.projectData['propertyType']);
  }

  @override
  void dispose() {
    _projectNameController.dispose();
    _uprnController.dispose();
    _addressController.dispose();
    _surveyorNameController.dispose();
    _contactDetailsController.dispose();
    _propertyManagerController.dispose();
    _propertyTypeController.dispose();
    super.dispose();
  }

  Future<void> _updateProjectDetails() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _firestore
            .collection('VoidProperty')
            .doc(widget.projectData['firstName'])
            .collection('Projects')
            .doc(widget.projectId)
            .update({
          'projectName': _projectNameController.text.trim(),
          'uprn': _uprnController.text.trim(),
          'address': _addressController.text.trim(),
          'surveyorName': _surveyorNameController.text.trim(),
          'contactDetails': _contactDetailsController.text.trim(),
          'propertyManager': _propertyManagerController.text.trim(),
          'propertyType': _propertyTypeController.text.trim(),
        });

        Get.snackbar(
          'Success',
          'Project details updated successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Navigator.pop(context);
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to update project details: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Edit Project Details',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField("Project Name", _projectNameController),
              _buildTextField("UPRN", _uprnController),
              _buildTextField("Address", _addressController),
              _buildTextField("Surveyor Name", _surveyorNameController),
              _buildTextField("Contact Details", _contactDetailsController),
              _buildTextField("Property Manager", _propertyManagerController),
              _buildTextField("Property Type", _propertyTypeController),
              const SizedBox(height: 20),
              CustomButton(text: "Save Changes", onPressed: _updateProjectDetails),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields with validation.
  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$label cannot be empty.";
          }
          return null;
        },
      ),
    );
  }
}
