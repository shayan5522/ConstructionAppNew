import 'package:constructionapp/CustomWidgets/custom_elevated_button.dart';
import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class OccupiedForm4 extends StatefulWidget {
  const OccupiedForm4({super.key});

  @override
  State<OccupiedForm4> createState() => _OccupiedForm4State();
}

class _OccupiedForm4State extends State<OccupiedForm4> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _contractDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(
          text:  "Clearance",
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
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                          onPressed: (){},
                          label: const CustomTextWidget(text: 'Small Skip',),
                          icon: const Icon(Icons.more_horiz_rounded),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.tealAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                      ),
                      ElevatedButton.icon(
                        onPressed: (){},
                        icon: const Icon(Icons.shopping_bag_rounded),
                        label: const CustomTextWidget(text: 'Large Skip',),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _contractDetailsController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Enter Description",
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
                  const SizedBox(height: 20,),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: (){},
                      label: const CustomTextWidget(text: 'Attach Photo',),
                      icon: const Icon(Icons.photo),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
