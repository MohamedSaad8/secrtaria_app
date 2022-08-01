import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:secrtaria/splash_view_module/presentation/screens/secrtaria_splash_view_screen.dart';
import 'core/services/service_locator.dart';



void main() {
 
  ServiceLocator().setup();
  runApp(const Secrtaria());
  
}

class Secrtaria extends StatelessWidget {
  const Secrtaria({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(360, 690) ,
      builder: (context, child) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Secrtaria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const SecrtariaSplashViewScreen(), 
    ),
    );
  }
}
