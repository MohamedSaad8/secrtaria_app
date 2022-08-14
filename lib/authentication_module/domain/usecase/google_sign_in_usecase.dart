
import '../repository/base_fire_base_user_repository.dart';

class GoogleSignInUseCase{
  final BaseFireBaseUserRepository baseFireBaseUserRepository;

  GoogleSignInUseCase({required this.baseFireBaseUserRepository});

  Future<void> execute() async{
    return await baseFireBaseUserRepository.googleSignInContract();
  }
}