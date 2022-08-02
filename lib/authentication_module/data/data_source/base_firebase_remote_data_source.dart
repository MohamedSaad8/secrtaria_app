
import '../../domain/entity/user_entity.dart';

abstract class BaseFirebaseRemoteDataSource {

  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> getUpdateUser(UserEntity user);
  Future<void> googleAuth();
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<String> getCurrentUId();
  Stream<List<UserEntity>> getAllUsers();
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<void> signInWithPhoneNumber(String pinCode);
  Future<void> forgotPassword(String email);
  
}