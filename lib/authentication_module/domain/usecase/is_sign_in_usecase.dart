
import '../repository/base_fire_base_user_repository.dart';

class IsSignInUseCase {

final BaseFireBaseUserRepository baseFireBaseUserRepository;

  IsSignInUseCase({required this.baseFireBaseUserRepository});

  Future<bool> call()async{
    return baseFireBaseUserRepository.isSignIn();
  }
}