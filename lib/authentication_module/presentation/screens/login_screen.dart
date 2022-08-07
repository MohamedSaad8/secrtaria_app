import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:secrtaria/core/constants/constant.dart';
import 'package:secrtaria/core/widgets/custom_button_widget.dart';
import 'package:secrtaria/core/widgets/custom_text_field.dart';
import 'package:secrtaria/core/widgets/horizontal_spacer.dart';
import 'package:secrtaria/core/widgets/vertical_spacer.dart';
import '../controller/auth_controller/auth_cubit.dart';
import '../controller/auth_controller/auth_states.dart';
import '../controller/credential_controller/credential_cubit.dart';
import '../controller/credential_controller/credential_state.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  bool isShowPassword = true;

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialFailure) {}
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return const Scaffold(
                    backgroundColor: Colors.white,
                  );
                } else {
                  print("Unauthenticsted");
                  return _bodyWidget();
                }
              },
            );
          }

          return _bodyWidget();
        },
      ),
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            VerticalSpacer(40.h),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              'Login',
              style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w700,
                  color: Constant.kMainColor),
            ),
            Text(
              'Please Sign in to continue',
              style: TextStyle(fontSize: 20.sp, color: Constant.kMainColor),
            ),
              ],
            ),
         
            const Divider(
              thickness: 2,
            ),
        
            CustomTextField(
                height: 10.h,
                prefixIconData: Icons.email,
                iconColor: Constant.kMainColor,
                hintText: "Email",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChange: (value) {},
                validate: (value){
                  return emailControllerValidator(value);
                  
                }),
         
            CustomTextField(
                height: 10.h,
                prefixIconData: Icons.lock,
                iconColor: Constant.kMainColor,
                obscureText: true,
                keyboardType: TextInputType.text,
                hintText: "Password",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChange: (value) {},
                validate: (value){
                  return passwordControllerValidator(value);
                } ,),
         
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                      color: Constant.kMainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
         
            CustomButton(
                buttonWidth: Get.width,
                buttonHeight: 45.h,
                buttonMargin: 10,
                buttonTextFontSize: 16.sp,
                buttonText: "Login",
                buttonAction: (){
                 
                }),
       
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "don't have an Account",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                HorizontalSpacer(5.w),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Constant.kMainColor),
                  ),
                ),
              ],
            ),
            VerticalSpacer(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50.r,
                    width: 50.r,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                          )
                        ]),
                    child: Center(
                      child: Text(
                        "G",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: Constant.kMainColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                          )
                        ]),
                    child: Center(
                      child: Text(
                        "F",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
           VerticalSpacer(25.h),
          ],
        ),
      ),
    );
  }

  String? emailControllerValidator(String? value) {
    if(value!.isEmpty)
    {
      return "Email Felid is Empty" ;
    }
    else if(!GetUtils.isEmail(value)){
      return "the email address is bad format" ;
    }
    return null;
  }
  
   String? passwordControllerValidator(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~+-/.]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Please Enter Strong  password at lest 8 characters';
      } else {
        return null;
      }
    }
  }

 
}
