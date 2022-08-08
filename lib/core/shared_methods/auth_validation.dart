
import 'package:get/get.dart';

 String? emailControllerValidator(String? value) {
    if(value!.isEmpty)
    {
      return "emailEmptyValidation".tr ;
    }
    else if(!GetUtils.isEmail(value)){
      return "emailBadFormateValidation".tr ;
    }
    return null;
  }

   String? userNameControllerValidator(String? value) {
    if(value!.isEmpty)
    {
      return "userNameEmpty".tr ;
    }
    if(value.length < 8)
    {
      return "usernameLength".tr;
    }
    return null;
  }
  
    String? phoneNumberControllerValidator(String? value) {
       RegExp regex =
        RegExp(r'(^01[0125][0-9]{8}$)');
    if(value!.isEmpty)
    {
      return "phoneEmpty".tr ;
    }
    else {
      if (!regex.hasMatch(value)) {
        return 'phoneBadFormateValidation'.tr;
      } else {
        return null;
      }
    }
  }
  
   String? passwordControllerValidator(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~+-/.]).{8,}$');
    if (value!.isEmpty) {
      return 'passwordEmpty'.tr;
    } else {
      if (!regex.hasMatch(value)) {
        return 'passwordNotValid'.tr;
      } else {
        return null;
      }
    }
  }
   
   String? confirmPasswordControllerValidator(String? value , String password) {
    if (value!.isEmpty) {
      return 'passwordEmpty'.tr;
    } else {
      if (value != password) {
        return 'confirmPassword'.tr;
      } else {
        return null;
      }
    }
  }