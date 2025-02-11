import 'package:TotalSurvey/CustomWidgets/custom_snackbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:TotalSurvey/Screens/Inspection/add_project_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../../CustomWidgets/custom_buttons.dart';

class InspectionFormScreen extends StatefulWidget {
  const InspectionFormScreen({super.key});

  @override
  _InspectionFormScreenState createState() => _InspectionFormScreenState();
}

class _InspectionFormScreenState extends State<InspectionFormScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  bool isLoading = false;

  File? _selectedImage1;
  File? _selectedImage2;
  File? _selectedImage3;

  List<String> publicUrls = [];

  final Map<String, bool> legalComplianceChecklist = {
    "Smoke Detectors": false,
    "Carbon Monoxide Detectors": false,
    "Fire Extinguishers": false,
    "Emergency Exits": false,
    "First Aid Kits": false,
    "Electrical Safety": false,
  };

  final Map<String, bool> housingActChecklist = {
    "Housing Health and Safety Rating System": false,
    "Landlord and Tenant Act": false,
    "Building Regulations": false,
  };

  Future<void> _pickImage(int imageSlot) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (imageSlot == 1) _selectedImage1 = File(pickedFile.path);
        if (imageSlot == 2) _selectedImage2 = File(pickedFile.path);
        if (imageSlot == 3) _selectedImage3 = File(pickedFile.path);
      });
    }
  }

  void _uploadImages(String projectId) async {
    try {
      setState(() {
        isLoading = true;
      });

      final supabase = Supabase.instance.client;
      final images = {
        'image1': _selectedImage1,
        'image2': _selectedImage2,
        'image3': _selectedImage3,
      };
      publicUrls.clear();
      for (var entry in images.entries) {
        final image = entry.value;
        if (image == null) continue;
        final fileName =
            '${entry.key}_${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}';

        // Use the dynamic project ID as the folder name
        final filePath = '${projectId}/$fileName';
        await supabase.storage.from('images').upload(filePath, image);

        final publicUrl = supabase.storage.from('images').getPublicUrl(filePath);
        publicUrls.add(publicUrl);
        print('Uploaded ${entry.key}: $publicUrl');
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All images uploaded successfully!')),
      );
      Get.to(() => ProjectDetailsScreen(
        argument: publicUrls,
      ));
    } catch (e) {
      print('Error uploading images: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred during upload.')),

      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _buildLargeImagePicker({required File? image, required int imageSlot}) {
    return GestureDetector(
      onTap: () => _pickImage(imageSlot),
      child: Container(
        width: double.infinity,
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(10),
        ),
        child: image != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(image, fit: BoxFit.cover),
        )
            : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_photo_alternate, size: 40, color: Colors.white),
            SizedBox(height: 8),
            Text("Add Image", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallImagePicker({required File? image, required int imageSlot}) {
    return GestureDetector(
      onTap: () => _pickImage(imageSlot),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 16,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(10),
        ),
        child: image != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(image, fit: BoxFit.cover),
        )
            : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_photo_alternate, size: 30, color: Colors.white),
            SizedBox(height: 8),
            Text("Add Image",
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildChecklistItem(Map<String, bool> checklist, String key) {
    return Row(
      children: [
        Checkbox(
          value: checklist[key],
          onChanged: (bool? value) {
            setState(() {
              checklist[key] = value ?? false;
            });
          },
          activeColor: Colors.teal,
        ),
        Expanded(
          child: Text(
            key,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Inspection Form",
          style: GoogleFonts.metamorphous(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar(
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.teal.shade200,
                    shape: BoxShape.circle,
                  ),
                  outsideDaysVisible: false,
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
            ),
            _buildLargeImagePicker(image: _selectedImage1, imageSlot: 1),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallImagePicker(image: _selectedImage2, imageSlot: 2),
                _buildSmallImagePicker(image: _selectedImage3, imageSlot: 3),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Legal Compliance Checklists",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: legalComplianceChecklist.keys.map((key) {
                      return _buildChecklistItem(legalComplianceChecklist, key);
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Housing Act Compliance",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: housingActChecklist.keys.map((key) {
                      return _buildChecklistItem(housingActChecklist, key);
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  isLoading
                      ? CircularProgressIndicator(
                    color: Colors.tealAccent,
                  )
                      : CustomButton(
                    text: "Next",
                    onPressed: () {
                      if (_selectedImage1 == null ||
                          _selectedImage2 == null ||
                          _selectedImage3 == null) {
                        customSnackBar(
                            context, "Error", "Please select images first");
                      } else {
                        final projectId = Uuid().v4();
                        _uploadImages(projectId);
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
