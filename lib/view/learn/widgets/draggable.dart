import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hamdars_task/view/learn/widgets/painter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DraggablePaint extends StatefulWidget {
  const DraggablePaint({super.key});

  @override
  State<DraggablePaint> createState() => _DraggablePaintState();
}

class _DraggablePaintState extends State<DraggablePaint>
    with TickerProviderStateMixin {
  bool isShowing = true;
  double x = 10.w;
  double y = 10.h;
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 20), (Timer t) {
      debugPrint('timer ticked');
      showWidget();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isShowing
        ? Positioned(
            left: x,
            top: y,
            child: GestureDetector(
              onPanUpdate: (details) {
                if (x <= 0 || x >= 25.w) {
                  setState(() {
                    isShowing = false;
                  });
                }
                if (y <= 0 || y >= 80.h) {
                  isShowing = false;
                }
                setState(() {
                  x += details.delta.dx;
                  y += details.delta.dy;
                });
              },
              child: SizedBox(
                width: 80.w,
                height: 10.h,
                child: CustomPaint(
                  painter: Painter(),
                  child: Container(
                      margin: EdgeInsets.only(top: 5.h),
                      child: Text(
                        'امتیاز برابر!',
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(167, 186, 255, 1)),
                      )),
                ),
              ),
            ),
          )
        : const SizedBox();
  }

  Future<void> showWidget() async {
    setState(() {
      isShowing = true;
      x = 10.w;
      y = 10.h;
    });
  }
}
