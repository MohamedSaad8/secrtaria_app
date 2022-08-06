import '../entity/user_entity.dart';

abstract class BaseFireBaseUserRepository {

  Future<void> signInContract(UserEntity user);
  Future<void> signUpContract(UserEntity user);
  Future<void> signOutContract();
  Future<void> getCreateCurrentUserContract(UserEntity user);
  bool isSignInContract();
  String getCurrentUIdContract();

 
}