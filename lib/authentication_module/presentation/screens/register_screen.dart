import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secrtaria/home_page.dart';
import '../controller/auth_controller/auth_cubit.dart';
import '../controller/credential_controller/credential_cubit.dart';
import '../controller/credential_controller/credential_state.dart';
import '../widgets/custom_register_form.dart';


class RegisterScreen extends StatelessWidget {

 const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialFailure) {
            print("my name is mohamed saad");
          }
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
            return const HomePage();
          }
           return  CustomRegisterForm();
        },
      ),
    );
  }
}
