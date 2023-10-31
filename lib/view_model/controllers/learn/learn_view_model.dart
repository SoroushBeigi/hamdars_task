import 'package:get/get.dart';
import 'package:hamdars_task/data/models/lesson_model.dart';
import 'package:hamdars_task/data/repositories/learn_repository.dart';

class LearnViewModel extends GetxController {
  RxList<Lesson> lessons = <Lesson>[].obs;
  RxBool loading = false.obs;
  RxInt selectedIndex = 5.obs;
  final repository = LearnRepository();
  Future<void> loadLessons() async {
    loading.value = true;
    lessons = (await repository.loadLessons()).obs;
    loading.value = false;
  }
}
