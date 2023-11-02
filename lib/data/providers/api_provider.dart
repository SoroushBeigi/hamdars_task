import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hamdars_task/common/utils/constants.dart';
import 'package:hamdars_task/data/models/lesson_model.dart';

class ApiProvider {
  final _dio = Dio();
  Future<List<Lesson>> getLessons() async {
    _dio.options.headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };
    _dio.options.baseUrl = ConstApi.baseUrl;
    _dio.options.followRedirects = false;
    debugPrint('reached provider');

    final response = await _dio.get(ConstApi.lessonsEndpoint);

    List<Lesson> lessons = <Lesson>[];
    List<dynamic> parsedJson = response.data;
    lessons = parsedJson
        .map(
          (e) => Lesson.fromJson(e),
        )
        .toList();

    return lessons;
  }
}
