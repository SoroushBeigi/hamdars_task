import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamdars_task/routes.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hamdars Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}