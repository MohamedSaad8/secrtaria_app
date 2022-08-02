import '../entity/user_entity.dart';
import '../repository/base_fire_base_user_repository.dart';

class GetUpdateUserUseCase{
final BaseFireBaseUserRepository baseFireBaseUserRepository;

  GetUpdateUserUseCase({required this.baseFireBaseUserRepository});
  Future<void> call(UserEntity user){
    return baseFireBaseUserRepository.getUpdateUser(user);
  }
}