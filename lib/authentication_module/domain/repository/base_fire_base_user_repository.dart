

import '../entity/user_entity.dart';

abstract class BaseFireBaseUserRepository {

  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<void> googleAuth();
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<bool> isSignIn();
  Future<String> getCurrentUId();
  Future<void> forgotPassword(String email);
  Future<void> getUpdateUser(UserEntity user);
  Stream<List<UserEntity>> getAllUsers();
 
}