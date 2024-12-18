import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BackendFunctions/OccupiedBackend/opening_sheet_backend.dart';
import '../../../CustomWidgets/custom_text_widget.dart';

class OccupiedForm1 extends StatefulWidget {
  const OccupiedForm1({super.key});

  @override
  State<OccupiedForm1> createState() => _OccupiedForm1State();
}

class _OccupiedForm1State extends State<OccupiedForm1> {
  final _formKey = GlobalKey<FormState>();
  final OpeningSheetFormController _formController = Get.put(OpeningSheetFormController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text:  "Client Information",
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          Card(
            color: const Color(0xFFF5F8F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextWidget(
                      text: "Client Name",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _formController.clientNameController,
                      decoration: InputDecoration(
                        hintText: "Enter client name",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter client name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const CustomTextWidget(
                      text: "Principle contractor",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _formController.principalContractorController,
                      decoration: InputDecoration(
                        hintText: "Enter Principle contractor",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter Principle contractor";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const CustomTextWidget(
                      text: "Contract",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _formController.contractController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Enter contract details",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter contract details";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
