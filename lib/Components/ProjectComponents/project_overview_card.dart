import 'package:constructionapp/CustomWidgets/custom_text_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProjectOverviewComponent extends StatelessWidget {
  const ProjectOverviewComponent({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: CustomTextWidget(
                  text: "Projects overview",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                ),
              ),
              const Row(
                children: [
                  CustomTextWidget(
                    text: "Total projects ",
                      fontSize: 16,
                      color: Colors.black87,
                  ),
                  CustomTextWidget(
                    text: "30",
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
                              value: 10,
                              title: 'Completed',
                              radius: 55,
                              titleStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            PieChartSectionData(
                              color: Colors.yellowAccent,
                              value: 10,
                              title: 'In Progress',
                              radius: 55,
                              titleStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            PieChartSectionData(
                              color: Colors.pinkAccent,
                              value: 10,
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _LegendItem(
                          color: Colors.tealAccent,
                          label: "Completed",
                          value: "10",
                        ),
                        _LegendItem(
                          color: Colors.yellowAccent,
                          label: "In progress",
                          value: "10",
                        ),
                        _LegendItem(
                          color: Colors.pinkAccent,
                          label: "Pending",
                          value: "10",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
           text:  label,
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
