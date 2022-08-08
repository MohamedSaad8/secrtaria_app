
import '../repository/base_fire_base_user_repository.dart';

class SignOutUseCase {
  final BaseFireBaseUserRepository baseFireBaseUserRepository;

  SignOutUseCase({required this.baseFireBaseUserRepository});

  Future<void> execute()async{
    return await baseFireBaseUserRepository.signOutContract();
  }
}