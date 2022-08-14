import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secrtaria/authentication_module/presentation/controller/credential_controller/credential_cubit.dart';

import 'authentication_module/presentation/controller/auth_controller/auth_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: GestureDetector(
          onTap: () async {
           await  BlocProvider.of<AuthCubit>(context).loggedOut();
          },
          child: const Text("hello"),
        ),
      ),
    );
  }
}
