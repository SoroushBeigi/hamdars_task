import 'dart:async';

import 'package:get/get.dart';
import 'package:hamdars_task/routes.dart';

class SplashScreenService {
  void goToLearnPage() {
     Timer(const Duration(seconds: 3) ,
                () => Get.toNamed(AppRoutes.learnScreen) );
  }
}
