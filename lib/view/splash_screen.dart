import 'package:flutter/material.dart';
import 'package:hamdars_task/view_model/services/splash_screen_service.dart';

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
    return const Scaffold(
      body: Center(
          child: Text(
        'Hamdars Test Task',
        style: TextStyle(
          fontSize: 20,
          letterSpacing: 2,
          fontWeight: FontWeight.w600,
        ),
      )),
    );
  }
}
