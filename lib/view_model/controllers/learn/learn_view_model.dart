import 'package:get/get.dart';
import 'package:hamdars_task/data/models/lesson_model.dart';
import 'package:hamdars_task/data/repositories/learn_repository.dart';

class LearnViewModel extends GetxController {
  RxList<Lesson> lessons = <Lesson>[].obs;
  RxBool loading = false.obs;
  final repository = LearnRepository();
  Future<void> loadLessons() async {
    loading.value = true;
    print('before');
    lessons = (await repository.loadLessons()).obs;
    print(lessons.length);
    loading.value=false;
  }
}
