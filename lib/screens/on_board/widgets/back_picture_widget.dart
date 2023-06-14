import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget backPictureWidget() {
  return Positioned(
    left: -30.sp,
    top: -140.sp,
    child: Container(
      width: 518.sp,
      height: 528.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children:[

          ]
      ),
    ),
  );
}