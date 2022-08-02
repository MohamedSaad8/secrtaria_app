import '../repository/base_fire_base_user_repository.dart';

class GetCurrentUIDUseCase{
final BaseFireBaseUserRepository baseFireBaseUserRepository;

  GetCurrentUIDUseCase({required this.baseFireBaseUserRepository});
  Future<String> call()async{
    return await baseFireBaseUserRepository.getCurrentUId();
  }
}