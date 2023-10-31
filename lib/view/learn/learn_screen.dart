import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hamdars_task/data/models/lesson_model.dart';
import 'package:hamdars_task/view_model/controllers/learn/learn_view_model.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart' as wheel;

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  final learnVM = Get.put(LearnViewModel());
  final _controller = wheel.FixedExtentScrollController(initialItem: 5);
  @override
  void initState() {
    learnVM.loadLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => learnVM.loading.value
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              child: SizedBox(
                child: SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 75.h,
                                ),
                                Text(learnVM
                                    .lessons[learnVM.selectedIndex.value]
                                    .name!),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 50.h,
                                ),
                                SizedBox(
                                  width: 100.w,
                                  height: 30.h,
                                  child: wheel.CircleListScrollView.useDelegate(
                                    onSelectedItemChanged: (value) {
                                      learnVM.selectedIndex.value = value;
                                    },
                                    controller: _controller,
                                    renderChildrenOutsideViewport: true,
                                    physics: const wheel
                                        .CircleFixedExtentScrollPhysics(),
                                    axis: Axis.horizontal,
                                    itemExtent: 22.w,
                                    clipToSize: false,
                                    radius: 38.w,
                                    childDelegate: wheel
                                        .CircleListChildLoopingListDelegate(
                                      children: learnVM.lessons
                                          .map(
                                            (element) => Center(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Container(
                                                  width: calculateSize(element),
                                                  height:
                                                      calculateSize(element),
                                                  color: Colors.grey[300],
                                                  child: Center(
                                                    child: SvgPicture.network(
                                                      element.unitIcon!,
                                                      placeholderBuilder: (BuildContext
                                                              context) =>
                                                          Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      10.0),
                                                              child:
                                                                  const CircularProgressIndicator()),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            )),
    );
  }

  double calculateSize(Lesson element) {
    final index = learnVM.selectedIndex.value;
    final currentId = learnVM.lessons[index].id;
    final String prevId, nextId;
    if (index == 0) {
      prevId = learnVM.lessons.last.id!;
    } else {
      prevId = learnVM.lessons[index - 1].id!;
    }
    if (index == learnVM.lessons.length - 1) {
      nextId = learnVM.lessons.first.id!;
    } else {
      nextId = learnVM.lessons[index + 1].id!;
    }

    if (element.id == currentId) {
      return 22.w;
    } else if (element.id == nextId || element.id == prevId) {
      return 20.w;
    } else {
      return 18.w;
    }
  }
}
