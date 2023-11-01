import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamdars_task/routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => GetMaterialApp(
        title: 'Hamdars Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Vazir'
        ),
        getPages: AppRoutes.appRoutes(),
      ),
    );
  }
}
