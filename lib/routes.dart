import 'package:get/get.dart';
import 'package:hamdars_task/view/learn/learn_screen.dart';
import 'package:hamdars_task/view/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String loginView = '/login_view';
  static const String homeView = '/home_view';

  static appRoutes() => [
        GetPage(
          name: splashScreen,
          page: () => const SplashScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: loginView,
          page: () => const LearnScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
