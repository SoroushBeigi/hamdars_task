import 'package:get/get.dart';
import 'package:hamdars_task/data/models/lesson_model.dart';
import 'package:hamdars_task/data/repositories/learn_repository.dart';

class LearnViewModel extends GetxController {

  final repository = LearnRepository();

  RxList<Lesson> lessons = <Lesson>[].obs;
  RxBool loading = false.obs;
  RxInt selectedIndex = 5.obs;
  RxBool isDraggableShowing=true.obs;


  Future<void> loadLessons() async {
    loading.value = true;
    lessons = (await repository.loadLessons()).obs;
    loading.value = false;
  }

  String timeFromMinutes(int minutes) => repository.timeFromMinutes(minutes);
}
