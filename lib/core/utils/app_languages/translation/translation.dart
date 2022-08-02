import 'package:get/get.dart';
import 'package:secrtaria/core/utils/app_languages/language/ar.dart';
import 'package:secrtaria/core/utils/app_languages/language/en.dart';

class Translation extends Translations { 
  @override
  Map<String, Map<String, String>> get keys =>{
      "en" : en ,
      "ar" : ar
  };
}