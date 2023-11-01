import 'package:flutter/material.dart';
import 'package:hamdars_task/view_model/services/splash/splash_screen_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenService _splashScreenService = SplashScreenService();
  @override
  void initState() {
    _splashScreenService.goToLearnPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: Text(
        'Hamdars Test Task',
        style: TextStyle(
          fontSize: 20.sp,
          letterSpacing: 2,
          fontWeight: FontWeight.w600,
        ),
      )),
    );
  }
}
