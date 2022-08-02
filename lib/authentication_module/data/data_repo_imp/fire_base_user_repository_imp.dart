import 'package:secrtaria/authentication_module/domain/entity/user_entity.dart';
import 'package:secrtaria/authentication_module/domain/repository/base_fire_base_user_repository.dart';
import '../data_source/fire_base_remote_data_source.dart';

class FireBaseUserRepositoryImp extends BaseFireBaseUserRepository {

  final FireBaseRemoteDataSource fireBaseRemoteDataSource;
  FireBaseUserRepositoryImp({
    required this.fireBaseRemoteDataSource,
  });


  @override
  Future<void> signIn(UserEntity user) async =>
      fireBaseRemoteDataSource.signIn(user);

  
  @override
  Future<void> signUp(UserEntity user) async =>
      fireBaseRemoteDataSource.signUp(user);

  @override
 Future<void> signOut() async => await fireBaseRemoteDataSource.signOut();


  @override
   Future<void> forgotPassword(String email) async =>
      fireBaseRemoteDataSource.forgotPassword(email);


  @override
  Stream<List<UserEntity>> getAllUsers() => fireBaseRemoteDataSource.getAllUsers();

  @override
   Future<void> getCreateCurrentUser(UserEntity user) async =>
      await fireBaseRemoteDataSource.getCreateCurrentUser(user);

  @override
 Future<String> getCurrentUId() async =>
      await fireBaseRemoteDataSource.getCurrentUId();

  @override
  Future<void> getUpdateUser(UserEntity user) async =>
      fireBaseRemoteDataSource.getUpdateUser(user);

  @override
  Future<void> googleAuth() async =>
      fireBaseRemoteDataSource.googleAuth();


  @override
 Future<bool> isSignIn() async => await fireBaseRemoteDataSource.isSignIn();
 


}
