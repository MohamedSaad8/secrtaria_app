import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constant.dart';

class AuthPageHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  const AuthPageHeader({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 35.sp,
            fontWeight: FontWeight.w700,
            color: Constant.kMainColor,
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 20.sp,
            color: Constant.kMainColor,
          ),
        ),
         Divider(
          thickness: 2,
          color: Colors.grey.shade500,
        ),
      ],
    );
  }
}
