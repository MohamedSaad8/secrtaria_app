import '../entity/user_entity.dart';
import '../repository/base_fire_base_user_repository.dart';

class GetCreateCurrentUserUseCase{
final BaseFireBaseUserRepository baseFireBaseUserRepository;

  GetCreateCurrentUserUseCase({required this.baseFireBaseUserRepository});

  Future<void> execute(UserEntity user)async{
    return await baseFireBaseUserRepository.getCreateCurrentUserContract(user);
  }
}