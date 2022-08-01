import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secrtaria/core/constants/constant.dart';
import 'package:secrtaria/onboearding_module/presentation/controller/page_view_controller.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onTap ;
  final PageViewController controller ;

  const SkipButton({super.key, required this.onTap, required this.controller});
  
  
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: controller.indicatorIndex <9 ? true : false,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          "Skip",
          style: TextStyle(
            color: Constant.kMainColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp
          ),
        ),
      ),
    );
  }
}
