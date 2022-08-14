
import '../../domain/entity/user_entity.dart';

abstract class BaseFirebaseRemoteDataSource {

  Future<void> signInDataSource(UserEntity user);
  Future<void> signUpDataSource(UserEntity user);
  bool isSignInDataSource();
  Future<void> signOutDataSource();
  String getCurrentUIdDataSource();
  Future<void> getCreateCurrentUserDataSource(UserEntity user);
   Future<void> googleAuth();
  Future<void> forgotPassword(String email);
 
  
}