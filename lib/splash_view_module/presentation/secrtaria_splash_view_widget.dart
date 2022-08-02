import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SecrtariaSplashViewWidget extends StatelessWidget {

final Widget nextPage ;
  const SecrtariaSplashViewWidget({super.key, required this.nextPage});
  @override
  Widget build(BuildContext context){
    return SplashScreenView(
      duration: 10000,
      imageSize: (150.w).toInt(),
      imageSrc: "assets/images/secrtaria_logo.png",
      text: "secrtariaBrandName".tr,
      textType: TextType.ColorizeAnimationText,
      textStyle:  TextStyle(
        fontSize: 35.0.sp,
        fontFamily: "Aclonica",
        fontWeight: FontWeight.bold
      ),
      pageRouteTransition: PageRouteTransition.Normal ,
      colors: const [
        Colors.red,
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.deepOrange,
        Colors.brown,
        Colors.cyan
      ],
      backgroundColor: Colors.white,
       navigateRoute: nextPage, 
    );
  }
}