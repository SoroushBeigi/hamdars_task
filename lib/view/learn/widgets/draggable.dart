import 'package:flutter/material.dart';
import 'package:hamdars_task/view/learn/widgets/painter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DraggablePaint extends StatefulWidget {
  const DraggablePaint({super.key});

  @override
  State<DraggablePaint> createState() => _DraggablePaintState();
}

class _DraggablePaintState extends State<DraggablePaint> {

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Painter(),
      child:
          Container(
            margin: EdgeInsets.only(top: 5.h),
              child: Text(
                'امتیاز برابر!',
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,color: const Color.fromRGBO(167, 186, 255, 1)),
              )),
        
    );
  }
}
