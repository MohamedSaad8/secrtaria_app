import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/constant.dart';
import '../../../core/shared_methods/auth_validation.dart';
import '../../../core/widgets/custom_button_widget.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/vertical_spacer.dart';
import '../../domain/entity/user_entity.dart';
import '../controller/credential_controller/credential_cubit.dart';
import 'auth_page_footer.dart';
import 'auth_page_header.dart';
import 'custom_date_input.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomRegisterForm extends StatelessWidget {
  String? username;
  String? password;
  String? confirmPassword;
  String? email;
  String? phoneNumber;
  DateTime? dateOfBirth;
  GlobalKey<FormState> formKey = GlobalKey();
  CustomRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            VerticalSpacer(MediaQuery.of(context).size.height * 0.05),
            AuthPageHeader(
              title: "Register".tr,
              subTitle: 'Please Sign Up to continue'.tr,
            ),
            //! UserName
            CustomTextField(
              height: 10.h,
              prefixIconData: Icons.person,
              iconColor: Constant.kMainColor,
              hintText: "UserName".tr,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              onChange: (value) {
                username = value;
              },
              validate: (value) {
                return userNameControllerValidator(value);
              },
            ),
            VerticalSpacer(10.h),
            //! phone
            CustomTextField(
              height: 10.h,
              prefixIconData: Icons.phone,
              iconColor: Constant.kMainColor,
              hintText: "Phone Number".tr,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              onChange: (value) {
                phoneNumber = value;
              },
              validate: (value) {
                return phoneNumberControllerValidator(value);
              },
            ),
            VerticalSpacer(10.h),
            //! email
            CustomTextField(
              height: 10.h,
              prefixIconData: Icons.email,
              iconColor: Constant.kMainColor,
              hintText: "Email".tr,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChange: (value) {
                email = value;
              },
              validate: (value) {
                return emailControllerValidator(value);
              },
            ),
            VerticalSpacer(10.h),
            //! password
            CustomTextField(
              height: 10.h,
              prefixIconData: Icons.lock,
              iconColor: Constant.kMainColor,
              obscureText: true,
              keyboardType: TextInputType.text,
              hintText: "Password".tr,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChange: (value) {
                password = value;
              },
              validate: (value) {
                return passwordControllerValidator(value);
              },
            ),
            VerticalSpacer(10.h),
            //! confirm password
            CustomTextField(
              height: 10.h,
              prefixIconData: Icons.lock,
              iconColor: Constant.kMainColor,
              obscureText: true,
              keyboardType: TextInputType.text,
              hintText: "Confirm Password".tr,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChange: (value) {
                confirmPassword = value;
              },
              validate: (value) {
                return confirmPasswordControllerValidator(value, password);
              },
            ),
            VerticalSpacer(10.h),
            Text("Date of birth".tr),
            CustomDateInputFelid(
              onChange: (date) {
                dateOfBirth = date;
              },
            ),
            VerticalSpacer(10.h),
            //! register button
            CustomButton(
              buttonWidth: Get.width,
              buttonHeight: 45.h,
              buttonMargin: 10,
              buttonTextFontSize: 16.sp,
              buttonText: "Sign Up".tr,
              buttonAction: () async {
                if (formKey.currentState!.validate()) {
                  await BlocProvider.of<CredentialCubit>(context)
                      .signUpController(
                    user: UserEntity(
                      email: email!,
                      phoneNumber: phoneNumber!,
                      name: username!,
                      dob: dateOfBirth.toString(),
                      password: password!,
                    ),
                  );
                }
              },
              buttonBorderRadius: 10,
            ),
            AuthPageFooter(
              footerNewActionName: 'Login'.tr,
              footerHitText: "already have an Account".tr,
              action: () {
                Navigator.pop(context);
              },
            ),
  
          ],
        ),
      ),
    );
  }
}
