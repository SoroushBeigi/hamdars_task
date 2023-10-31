import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
import 'package:hamdars_task/data/models/lesson_model.dart';

class ApiProvider {
  // final _dio = Dio();
  Future<List<Lesson>> getLessons() async {
    // _dio.options.headers = {
    //   'Content-Type': 'application/json; charset=utf-8',
    // };
    // _dio.options.baseUrl = 'https://app.taraz.org/api/qb/v4';
    // _dio.options.followRedirects = false;
    // debugPrint('reached provider');
    // try {
    //   final response = await _dio.get('/test_unit');
    //   if (response.statusCode == 307) {
    //     print('hi');
    //     print(response.data);
    //   }
    // } catch (e) {}
    List<Lesson> lessons = <Lesson>[];
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      String json =
          '[{"id":"c3eb3018-b321-4a55-a5cf-512304d74ca0","name":"حسابان 2 و پایه","unit_icon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/subjects-exps/math2-01.svg","sum_user_study":0,"hamdarsUserUnitLevelIndex":1,"hamdarsUserCurrentUnitLevelPoint":59,"hamdarsUserMaxUnitLevelPoint":150,"hamdarsUserMinUnitLevelPoint":45},{"id":"16d52c15-33bc-4c69-bfe1-9e68cb527ac6","name":"فارسی 3","unit_icon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/subjects-exps/adabiyat3-01.svg","sum_user_study":0,"hamdarsUserUnitLevelIndex":0,"hamdarsUserCurrentUnitLevelPoint":28,"hamdarsUserMaxUnitLevelPoint":45,"hamdarsUserMinUnitLevelPoint":0},{"id":"e0911078-e47b-4592-97b0-52b55b944b25","name":"شیمی 3","unit_icon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/subjects-exps/chemistery3-01.svg","sum_user_study":300,"hamdarsUserUnitLevelIndex":1,"hamdarsUserCurrentUnitLevelPoint":79,"hamdarsUserMaxUnitLevelPoint":150,"hamdarsUserMinUnitLevelPoint":45},{"id":"a78d9e2b-3e5c-43f6-b339-c5be5d4a8ada","name":"دین و زندگی 3","unit_icon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/subjects-exps/dini3-01.svg","sum_user_study":1200,"hamdarsUserUnitLevelIndex":0,"hamdarsUserCurrentUnitLevelPoint":2,"hamdarsUserMaxUnitLevelPoint":45,"hamdarsUserMinUnitLevelPoint":0},{"id":"397a501c-a039-41b0-8558-ea8e3499c0c4","name":"عربی،زبان قرآن 3 ","unit_icon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/subjects-exps/arabic3-01.svg","sum_user_study":0,"hamdarsUserUnitLevelIndex":0,"hamdarsUserCurrentUnitLevelPoint":0,"hamdarsUserMaxUnitLevelPoint":45,"hamdarsUserMinUnitLevelPoint":0},{"id":"dba95c37-731c-4649-8022-35fe746b1996","name":"فیزیک 3 (رشته ریاضی)","unit_icon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/subjects-exps/physics3-01.svg","sum_user_study":0,"hamdarsUserUnitLevelIndex":0,"hamdarsUserCurrentUnitLevelPoint":16,"hamdarsUserMaxUnitLevelPoint":45,"hamdarsUserMinUnitLevelPoint":0},{"id":"c9f16ce8-787a-4965-ac40-acff23200c51","name":"ریاضیات گسسته","unit_icon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/subjects-exps/gosaste-01.svg","sum_user_study":0,"hamdarsUserUnitLevelIndex":1,"hamdarsUserCurrentUnitLevelPoint":76,"hamdarsUserMaxUnitLevelPoint":150,"hamdarsUserMinUnitLevelPoint":45},{"id":"0e27fbb1-6cd0-47d3-9c12-9c08c41b93e9","name":"انگلیسی 3","unit_icon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/subjects-exps/english3-01.svg","sum_user_study":720,"hamdarsUserUnitLevelIndex":0,"hamdarsUserCurrentUnitLevelPoint":28,"hamdarsUserMaxUnitLevelPoint":45,"hamdarsUserMinUnitLevelPoint":0},{"id":"4355f58c-8229-425d-bc35-b7e288e95e4b","name":"هندسه 3","unit_icon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/subjects-exps/geometry-01.svg","sum_user_study":0,"hamdarsUserUnitLevelIndex":0,"hamdarsUserCurrentUnitLevelPoint":27,"hamdarsUserMaxUnitLevelPoint":45,"hamdarsUserMinUnitLevelPoint":0},{"id":"993f7581-4d49-4fbc-9515-cd9c57959576","name":"حسابان (2)","unit_icon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/subjects-exps/math2-01.svg","sum_user_study":0,"hamdarsUserUnitLevelIndex":0,"hamdarsUserCurrentUnitLevelPoint":0,"hamdarsUserMaxUnitLevelPoint":45,"hamdarsUserMinUnitLevelPoint":0}]';
      List<dynamic> parsedJson = jsonDecode(json);
      lessons = parsedJson
          .map(
            (e) => Lesson.fromJson(e),
          )
          .toList();
    });

    return lessons;
  }
}
