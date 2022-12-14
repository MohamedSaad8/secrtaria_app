import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../core/services/service_locator.dart';
import '../../../home_module/presentation/screens/home_screen.dart';
import '../controller/auth_controller/auth_cubit.dart';
import '../controller/auth_controller/auth_states.dart';
import '../controller/credential_controller/credential_cubit.dart';
import '../controller/credential_controller/credential_state.dart';
import '../widgets/custom_register_form.dart';


class RegisterScreen extends StatelessWidget {

 const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialLoading) {
            context.read<CredentialCubit>().isLoading = true;
          }
          if (credentialState is CredentialSuccess) {
            context.read<CredentialCubit>().isLoading = false;
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialFailure) {
            context.read<CredentialCubit>().isLoading = false;
            Get.snackbar(
              "Registration Filed",
              credentialState.errorMessage,
              snackPosition: SnackPosition.TOP,
              duration: const Duration(seconds: 6),
            );
          }
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return  HomeScreen();
                } else {
                  return CustomRegisterForm();
                }
              },
            );
          }
          return ModalProgressHUD(
            inAsyncCall: context.read<CredentialCubit>().isLoading,
            child: getIt<CustomRegisterForm>(),
          );
        },
      ),
    );
  }
}
