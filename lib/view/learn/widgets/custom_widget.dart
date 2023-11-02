import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamdars_task/common/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({super.key});

  @override
  CustomWidgetState createState() => CustomWidgetState();
}

class CustomWidgetState extends State<CustomWidget>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    Future.delayed(const Duration(seconds: 2), () {
      updateWidget();
    });
    Timer.periodic(const Duration(seconds: 14), (Timer t) {
      updateWidget();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: _isExpanded ? 20.h : 8.h,
      height: 8.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffE8F8F9),
            Color(0xffE8F8F9),
            Colors.white,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(ConstAssets.student),
          if (_isExpanded) const SizedBox(width: 6),
          if (_isExpanded)
            Text(
              "طراحی سوال",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff00898A),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> updateWidget() async {
    setState(() {
      _isExpanded = true;
    });

    await Future.delayed(const Duration(milliseconds: 3000), () {
      _controller.forward();
      setState(() {
        _isExpanded = false;
      });
    });
  }
}
