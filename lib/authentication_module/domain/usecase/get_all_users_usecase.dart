import '../entity/user_entity.dart';
import '../repository/base_fire_base_user_repository.dart';

class GetAllUsersUseCase{
 final BaseFireBaseUserRepository baseFireBaseUserRepository;

  GetAllUsersUseCase({required this.baseFireBaseUserRepository});

  Stream<List<UserEntity>> call(){
    return baseFireBaseUserRepository.getAllUsers();
  }
}