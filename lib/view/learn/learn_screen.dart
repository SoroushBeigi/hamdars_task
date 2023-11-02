import 'package:hamdars_task/common/utils/constants.dart';
import 'package:hamdars_task/common/utils/persian_numbers.dart';
import 'package:hamdars_task/view/learn/widgets/custom_widget.dart';
import 'package:hamdars_task/view/learn/widgets/draggable.dart';
import 'package:hamdars_task/view/learn/widgets/wheel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide ScreenType;
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Align(
            alignment: Alignment.topRight,
            child: Container(
                margin: EdgeInsets.only(top: 5.h),
                child: const CustomWidget())),
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        body: Obx(() => learnVM.loading.value
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                child: SizedBox(
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Stack(
                            children: [
                              // ignore: prefer_const_constructors
                              Wheel(),
                              Column(
                                children: [
                                  SizedBox(height: 82.h),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.5.w),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                        color: Colors.yellow[600]),
                                    child: Text(
                                      '${PersianNumbers.convertEnToFa(learnVM.lessons[learnVM.selectedIndex.value].hamdarsUserUnitLevelIndex!.toString())} سطح',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(height: 0.75.h),
                                  Text(
                                    PersianNumbers.convertEnToFa(learnVM
                                        .lessons[learnVM.selectedIndex.value]
                                        .name!),
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 0.75.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        learnVM.timeFromMinutes(learnVM
                                            .lessons[
                                                learnVM.selectedIndex.value]
                                            .sumUserStudy!),
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(1.w, 0, 0, 1.w),
                                        child: SvgPicture.asset(
                                            ConstAssets.studyTime,
                                            colorFilter: ColorFilter.mode(
                                                Colors.grey[700]!,
                                                BlendMode.srcIn)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const DraggablePaint(),
                            ],
                          ),
                        ]),
                  ),
                ),
              )),
      ),
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
