import 'package:hamdars_task/data/models/lesson_model.dart';
import 'package:hamdars_task/data/providers/api_provider.dart';

class LearnRepository {
  final ApiProvider _apiProvider = ApiProvider();
  Future<List<Lesson>> loadLessons() async {
    List<Lesson> lessons = await _apiProvider.getLessons();
    return lessons;
  }
}
