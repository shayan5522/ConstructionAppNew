import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../BackendFunctions/Other/occupied_counter_backend.dart';
import '../../CustomWidgets/custom_text_widget.dart';

class ProjectOverviewComponent extends StatefulWidget {
  ProjectOverviewComponent({super.key});
  @override
  State<ProjectOverviewComponent> createState() => _ProjectOverviewComponentState();
}

class _ProjectOverviewComponentState extends State<ProjectOverviewComponent> {
  final DocumentController documentController = Get.put(DocumentController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    documentController.fetchDocuments();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 300,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Obx(() {
          final completedProjects = documentController.mainDocs
              .where((doc) => doc['subDocCount'] == 11)
              .length;
          final pendingProjects = documentController.mainDocs.length - completedProjects;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: CustomTextWidget(
                  text: "Projects Overview",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              Row(
                children: [
                  const CustomTextWidget(
                    text: "Total projects ",
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  CustomTextWidget(
                    text: "${documentController.mainDocs.length}",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: PieChart(
                        PieChartData(
                          sectionsSpace: 2,
                          centerSpaceRadius: 40,
                          sections: [
                            PieChartSectionData(
                              color: Colors.tealAccent,
                              value: completedProjects.toDouble(),
                              title: 'Completed',
                              radius: 55,
                              titleStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            PieChartSectionData(
                              color: Colors.pinkAccent,
                              value: pendingProjects.toDouble(),
                              title: 'Pending',
                              radius: 55,
                              titleStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _LegendItem(
                          color: Colors.tealAccent,
                          label: "Completed",
                          value: "$completedProjects",
                        ),
                        _LegendItem(
                          color: Colors.pinkAccent,
                          label: "Pending",
                          value: "$pendingProjects",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String value;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          CircleAvatar(radius: 6, backgroundColor: color),
          const SizedBox(width: 8),
          CustomTextWidget(
            text: label,
            fontSize: 14,
          ),
          const SizedBox(width: 4),
          CustomTextWidget(
            text: value,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
