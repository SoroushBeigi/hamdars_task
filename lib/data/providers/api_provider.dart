import 'package:hamdars_task/data/models/lesson_model.dart';

class ApiProvider {
  Future<List<Lesson>> getLessons() {
    return Future.delayed(const Duration(seconds: 2))
        .then((value) => [Lesson(id: 'a')]);
  }
}
