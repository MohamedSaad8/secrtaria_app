import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:secrtaria/authentication_module/presentation/controller/credential_controller/credential_cubit.dart';
import 'package:secrtaria/authentication_module/presentation/screens/register_screen.dart';
import 'package:secrtaria/authentication_module/presentation/widgets/auth_page_footer.dart';
import 'package:secrtaria/authentication_module/presentation/widgets/auth_page_header.dart';
import 'package:secrtaria/core/services/service_locator.dart';
import '../../../core/constants/constant.dart';
import '../../../core/shared_methods/auth_validation.dart';
import '../../../core/widgets/custom_button_widget.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/vertical_spacer.dart';
import '../../domain/usecase/forgot_password_usecase.dart';
import 'google_sign_in_button.dart';

// ignore: must_be_immutable
class CustomLoginForm extends StatelessWidget {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  CustomLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              VerticalSpacer(MediaQuery.of(context).size.height * 0.08),
              AuthPageHeader(
                title: "Login".tr,
                subTitle: 'Please Sign in to continue'.tr,
              ),
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
                  return passwordControllerValidator(value, isForLogin: true);
                },
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () async {
                    // ignore: todo
                    //TODO: handel this case
                    await ForgotPasswordUseCase(
                            baseFireBaseUserRepository: getIt())
                        .execute("mohamedsaad.cis@gmail.com");
                  },
                  child: Text(
                    'Forgot password'.tr,
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
                buttonText: "Login".tr,
                buttonAction: () async {
                  if (formKey.currentState!.validate()) {
                    await BlocProvider.of<CredentialCubit>(context)
                        .signInController(email: email!, password: password!);
                  }
                },
                buttonBorderRadius: 10,
              ),
              AuthPageFooter(
                footerNewActionName: 'Register'.tr,
                footerHitText: "don't have an Account".tr,
                action: () {
                  Get.to(() => const RegisterScreen());
                },
              ),
              VerticalSpacer(5.h),
              GoogleSignInButton(
                onTap: () async {
                  await BlocProvider.of<CredentialCubit>(context)
                      .googleSignInController();
                },
              ),
              VerticalSpacer(MediaQuery.of(context).size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
