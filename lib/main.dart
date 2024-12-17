import 'package:constructionapp/Screens/OccupiedPropertyScreens/kitchen_screen.dart';
import 'package:constructionapp/Screens/OccupiedPropertyScreens/major_work_screen.dart';
import 'package:constructionapp/Screens/OccupiedPropertyScreens/opening_sheet_screen.dart';
import 'package:constructionapp/Screens/main_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    DevicePreview(
        enabled: !kReleaseMode,
        builder: (context)=>const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Construction App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
