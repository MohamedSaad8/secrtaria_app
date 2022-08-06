import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../../../domain/entity/user_entity.dart';
import '../../../domain/usecase/get_create_current_user_usecase.dart';
import '../../../domain/usecase/sign_in_usecase.dart';
import '../../../domain/usecase/sign_up_usecase.dart';
import 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignUpUseCase signUpUseCase = getIt();
  final SignInUseCase signInUseCase = getIt();
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase = getIt();

  CredentialCubit() : super(CredentialInitial());

  Future<void> signInController({ required String email, required String password,}) async {
    emit(CredentialLoading());
    try {
      await signInUseCase.execute(UserEntity(email: email, password: password));
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> signUpController({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signUpUseCase
          .execute(UserEntity(email: user.email, password: user.password));
      await getCreateCurrentUserUseCase.execute(user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
