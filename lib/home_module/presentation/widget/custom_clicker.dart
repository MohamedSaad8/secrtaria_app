import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secrtaria/core/constants/constant.dart';

class CustomClicker extends StatelessWidget {
  const CustomClicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 17.w,
      height: 65.h,
      decoration: BoxDecoration(
        color: Constant.clickerColor,
        border: Border.all(color: Colors.white, width: 5),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(17),
          bottomRight: Radius.circular(17),
        ),
      ),
    );
  }
}
