import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamdars_task/view_model/controllers/learn/learn_view_model.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  final learnVM = Get.put(LearnViewModel());
  @override
  void initState() {
    learnVM.loadLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => learnVM.loading.value
        ? const Center(child: CircularProgressIndicator())
        : Text(learnVM.lessons[0].id.toString()));
  }
}
