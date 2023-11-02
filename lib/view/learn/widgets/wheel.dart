import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide ScreenType;
import 'package:hamdars_task/data/models/lesson_model.dart';
import 'package:hamdars_task/view_model/controllers/learn/learn_view_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart' as wheel;

class Wheel extends StatefulWidget {
  const Wheel({super.key});

  @override
  State<Wheel> createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  final learnVM = Get.put(LearnViewModel());
  final _controller = wheel.FixedExtentScrollController(initialItem: 5);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
        ),
        GestureDetector(
          onTapDown: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.elliptical(100.w, 50.w),
                topLeft: Radius.elliptical(100.w, 50.w),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 12,
                ),
              ],
            ),
            width: 100.w,
            height: 50.h,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 100.w,
                height: 20.h,
                child: wheel.CircleListScrollView.useDelegate(
                  onSelectedItemChanged: (value) {
                    learnVM.selectedIndex.value = value;
                  },
                  controller: _controller,
                  renderChildrenOutsideViewport: true,
                  physics: const wheel.CircleFixedExtentScrollPhysics(),
                  axis: Axis.horizontal,
                  itemExtent:
                      Device.screenType == ScreenType.tablet ? 17.5.w : 25.w,
                  clipToSize: false,
                  radius: 45.w,
                  childDelegate: wheel.CircleListChildLoopingListDelegate(
                    children: learnVM.lessons
                        .map(
                          (element) => Center(
                            child: CircularPercentIndicator(
                              radius: calculateSize(element) / 2 + 1.5.w,
                              lineWidth: 2.w,
                              animation: true,
                              percent: learnVM
                                          .lessons[learnVM.selectedIndex.value]
                                          .id ==
                                      element.id
                                  ? element.percent!
                                  : 0,
                              backgroundColor: Colors.grey[200]!,
                              progressColor:
                                  const Color.fromRGBO(117, 139, 235, 1),
                              center: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                radius: calculateSize(element) / 2,
                                child: SvgPicture.network(
                                  element.unitIcon!,
                                  placeholderBuilder: (BuildContext context) =>
                                      Container(
                                          padding: const EdgeInsets.all(10),
                                          child:
                                              const CircularProgressIndicator()),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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
      if (Device.screenType == ScreenType.tablet) {
        return 14.w;
      } else {
        return 22.w;
      }
    } else if (element.id == nextId || element.id == prevId) {
      if (Device.screenType == ScreenType.tablet) {
        return 13.w;
      } else {
        return 20.w;
      }
    } else {
      if (Device.screenType == ScreenType.tablet) {
        return 12.w;
      } else {
        return 18.w;
      }
    }
  }

  void onTap(TapDownDetails details) {
    if (details.localPosition.dx < Device.width / 2 - 15.w) {
      final int newIndex;
      if (_controller.selectedItem == 0) {
        newIndex = learnVM.lessons.length - 1;
      } else {
        newIndex = _controller.selectedItem - 1;
      }
      _controller.animateToItem(newIndex,
          duration: const Duration(milliseconds: 600), curve: Curves.ease);
    }
    if (details.localPosition.dx > Device.width / 2 + 15.w) {
      final int newIndex;
      if (_controller.selectedItem == learnVM.lessons.length - 1) {
        newIndex = 0;
      } else {
        newIndex = _controller.selectedItem + 1;
      }
      _controller.animateToItem(newIndex,
          duration: const Duration(milliseconds: 600), curve: Curves.ease);
    }
  }
}
