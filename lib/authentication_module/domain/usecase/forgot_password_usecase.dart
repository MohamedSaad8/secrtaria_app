
import '../repository/base_fire_base_user_repository.dart';

class ForgotPasswordUseCase{
final BaseFireBaseUserRepository baseFireBaseUserRepository;

  ForgotPasswordUseCase({required this.baseFireBaseUserRepository});

  Future<void> call(String email){
    return baseFireBaseUserRepository.forgotPassword(email);
  }
}