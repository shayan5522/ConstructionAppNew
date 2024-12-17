import 'package:constructionapp/CustomWidgets/custom_elevated_button.dart';
import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import '../../../Controllers/checkbox_controller.dart';
import '../../../CustomWidgets/custom_checkboxes.dart';
import '../../../CustomWidgets/custom_form_field.dart';
import 'occupied_custom_card.dart';
import 'occupied_image_selector.dart';
import 'occupied_submit_buttons.dart';

class CommonScreenLayout extends StatelessWidget {
  final String appBarTitle;
  final String sectionTitle;
  final List<Map<String, dynamic>> checklistData;
  final String totalCost;
  final VoidCallback submitButton;
  final String textFieldHint1;
  final String textFieldHint2;

  const CommonScreenLayout({
    super.key,
    required this.appBarTitle,
    required this.sectionTitle,
    required this.checklistData,
    required this.totalCost,
    required this.submitButton,
    required this.textFieldHint1,
    required this.textFieldHint2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.white70,
        title: Text(appBarTitle),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomImageSelector(),
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CustomElevatedButton(
                      text: 'Skip This Session',
                      onPressed:(){},
                      width: 300,
                      height: 45,
                      backgroundColor: Colors.tealAccent,
                      textColor: Colors.black,
                      borderRadius: 30,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              CustomTextWidget(
               text:  sectionTitle,
               fontSize: 24, fontWeight: FontWeight.w700,
              ),
              Card(
                color: const Color(0xFFF5F8F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        hint: textFieldHint1,
                        label: textFieldHint1,
                        leading: const Icon(Icons.help),
                      ),
                      CustomTextFormField(
                        hint: textFieldHint2,
                        label: textFieldHint2,
                        leading: const Icon(Icons.help),
                      )
                    ],
                  ),
                ),
              ),
              const CustomTextWidget(
                text: "Check Lists",
                fontSize: 18, fontWeight: FontWeight.w700,
              ),
              Card(
                color: const Color(0xFFF5F8F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: checklistData.length,
                      itemBuilder: (context, index) {
                        final data = checklistData[index];
                        return Column(
                          children: [
                            CustomOccupiedCard(
                              title: data['title'],
                              options: [
                                CustomCheckboxes(label: 'Yes', controller: CheckboxController()),
                                CustomCheckboxes(label: 'No', controller: CheckboxController()),
                                CustomCheckboxes(label: 'N/A', controller: CheckboxController()),
                              ],
                              selectedQuantity: data['selectedQuantity'],
                              quantityOptions: data['quantityOptions'],
                              selectedCost: data['selectedCost'],
                              costOptions: data['costOptions'],
                              onAddNote: () {},
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomTextWidget(
                           text:  'Total Cost : $totalCost',
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
             OccupiedSubmitButtons(nextPage:submitButton,)
            ],
          ),
        ),
      ),
    );
  }
}
