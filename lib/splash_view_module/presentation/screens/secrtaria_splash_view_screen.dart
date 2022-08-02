import 'package:flutter/material.dart';
import '../../../onboearding_module/presentation/screens/on_boarding_screen.dart';
import '../secrtaria_splash_view_widget.dart';

class SecrtariaSplashViewScreen extends StatelessWidget {
const SecrtariaSplashViewScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context){
    print("hello all");
    return   SecrtariaSplashViewWidget(nextPage: OnBoardingScreen(),);
  }
}