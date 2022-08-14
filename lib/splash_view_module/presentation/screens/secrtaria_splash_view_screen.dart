import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secrtaria/authentication_module/presentation/screens/login_screen.dart';
import 'package:secrtaria/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../authentication_module/presentation/controller/auth_controller/auth_cubit.dart';
import '../../../authentication_module/presentation/controller/auth_controller/auth_states.dart';
import '../../../onboearding_module/presentation/screens/on_boarding_screen.dart';
import '../widgets/secrtaria_splash_view_widget.dart';

class SecrtariaSplashViewScreen extends StatefulWidget {
  const SecrtariaSplashViewScreen({Key? key}) : super(key: key);

  @override
  State<SecrtariaSplashViewScreen> createState() =>
      _SecrtariaSplashViewScreenState();
}

class _SecrtariaSplashViewScreenState extends State<SecrtariaSplashViewScreen> {
  bool? isSeen;
  @override
  void initState() {
    super.initState();
    onBoardingState();
  }

  void onBoardingState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isSeen = preferences.getBool("isOnBoardingSeen");
  }

  @override
  Widget build(BuildContext context) {
    return SecrtariaSplashViewWidget(
      nextPage: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return const HomePage();
          } else if (isSeen != null && isSeen == true) {
            return  LoginScreen();
          } else {
            return OnBoardingScreen();
          }
        },
      ),
    );
  }
}
