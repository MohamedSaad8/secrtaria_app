import '../repository/base_fire_base_user_repository.dart';

class GetCurrentUIDUseCase{
final BaseFireBaseUserRepository baseFireBaseUserRepository;

  GetCurrentUIDUseCase({required this.baseFireBaseUserRepository});
  String execute(){
    return  baseFireBaseUserRepository.getCurrentUIdContract();
  }
}