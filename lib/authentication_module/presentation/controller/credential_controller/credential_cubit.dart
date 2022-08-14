import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/user_entity.dart';
import '../../../domain/usecase/get_create_current_user_usecase.dart';
import '../../../domain/usecase/google_sign_in_usecase.dart';
import '../../../domain/usecase/sign_in_usecase.dart';
import '../../../domain/usecase/sign_up_usecase.dart';
import 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  bool isLoading = false;
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final GoogleSignInUseCase googleSignInUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;

  CredentialCubit(
      {required this.signUpUseCase,
      required this.signInUseCase,
      required this.googleSignInUseCase,
      required this.getCreateCurrentUserUseCase})
      : super(CredentialInitial());

  Future<void> signInController({
    required String email,
    required String password,
  }) async {
    emit(CredentialLoading());
    try {
      await signInUseCase.execute(UserEntity(email: email, password: password));
      emit(CredentialSuccess());
    } on FirebaseAuthException catch (ex) {
      emit(CredentialFailure(errorMessage: ex.message!));
    }
  }

  Future<void> signUpController({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signUpUseCase
          .execute(UserEntity(email: user.email, password: user.password));
      await getCreateCurrentUserUseCase.execute(user);
      emit(CredentialSuccess());
    } on FirebaseAuthException catch (ex) {
      emit(CredentialFailure(errorMessage: ex.message!));
    }
  }

  Future<void> googleSignInController() async {
    emit(CredentialLoading());
    try {
      await googleSignInUseCase.execute();
      emit(CredentialSuccess());
    } on FirebaseAuthException catch (ex) {
      emit(CredentialFailure(errorMessage: ex.message!));
    }
  }
}
