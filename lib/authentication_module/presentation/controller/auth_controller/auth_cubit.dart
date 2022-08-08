import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secrtaria/authentication_module/presentation/controller/auth_controller/auth_states.dart';
import '../../../domain/usecase/get_current_uid_usecase.dart';
import '../../../domain/usecase/is_sign_in_usecase.dart';
import '../../../domain/usecase/sign_out_usecase.dart';

class AuthCubit extends Cubit<AuthState> {
  IsSignInUseCase isSignInUseCase;
  GetCurrentUIDUseCase currentUIDUseCase;
  SignOutUseCase signOutUseCase ;

  AuthCubit({required this.isSignInUseCase, required this.currentUIDUseCase , required this.signOutUseCase})
      : super(AuthInitial());

  void appStarted() {
    bool isSignIn = isSignInUseCase.execute();

    if (isSignIn) {
      final uid = currentUIDUseCase.execute();
      emit(Authenticated(uid: uid));
    } else {
      emit(UnAuthenticated());
    }
  }


  void loggedIn(){
    try{
       final uid= currentUIDUseCase.execute();
      emit(Authenticated(uid: uid));
    }catch(_){
      emit(UnAuthenticated());
    }
  }


    Future<void> loggedOut()async{
    try{
      await signOutUseCase.execute();
      emit(UnAuthenticated());
    }catch(_){
      emit(UnAuthenticated());
    }
  }
}
