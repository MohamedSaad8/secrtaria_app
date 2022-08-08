import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constant.dart';
import '../../../core/widgets/horizontal_spacer.dart';

class AuthPageFooter extends StatelessWidget {

  final String footerHitText ;
  final String footerNewActionName ;
 final VoidCallback action ;
  const AuthPageFooter({Key? key, required this.footerHitText, required this.footerNewActionName, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          footerHitText,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        HorizontalSpacer(5.w),
        InkWell(
          onTap: action,
          child: Text(
            footerNewActionName,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: Constant.kMainColor,
            ),
          ),
        ),
      ],
    );
  }
}
