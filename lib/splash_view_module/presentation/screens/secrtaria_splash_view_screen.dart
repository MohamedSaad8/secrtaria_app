// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../authentication_module/presentation/controller/auth_controller/auth_cubit.dart';
import '../../../authentication_module/presentation/controller/auth_controller/auth_states.dart';
import '../../../onboearding_module/presentation/screens/on_boarding_screen.dart';
import '../widgets/secrtaria_splash_view_widget.dart';

class SecrtariaSplashViewScreen extends StatelessWidget {
  const SecrtariaSplashViewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SecrtariaSplashViewWidget(
      nextPage: BlocBuilder<AuthCubit, AuthState>(
        builder: (context ,state){
           if (state is Authenticated)
            {
                  return const Scaffold(
                    backgroundColor: Colors.green,
                  );
                } else {
             return OnBoardingScreen();
           } 
        },
      ),
    );
  }
}
