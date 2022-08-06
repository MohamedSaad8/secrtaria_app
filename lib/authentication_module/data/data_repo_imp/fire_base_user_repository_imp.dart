import 'package:secrtaria/authentication_module/domain/entity/user_entity.dart';
import 'package:secrtaria/authentication_module/domain/repository/base_fire_base_user_repository.dart';
import "../data_source/base_firebase_remote_data_source.dart" ;

class FireBaseUserRepositoryImp extends BaseFireBaseUserRepository {

  final BaseFirebaseRemoteDataSource baseFirebaseRemoteDataSource ;
  
  FireBaseUserRepositoryImp({
    required this.baseFirebaseRemoteDataSource,
  });


  @override
  Future<void> signInContract(UserEntity user) async =>
     await baseFirebaseRemoteDataSource.signInDataSource(user);

  
  @override
  Future<void> signUpContract(UserEntity user) async =>
    await  baseFirebaseRemoteDataSource.signUpDataSource(user);

  @override
 Future<void> signOutContract() async => await baseFirebaseRemoteDataSource.signOutDataSource();


  
  @override
   Future<void> getCreateCurrentUserContract(UserEntity user) async =>
      await baseFirebaseRemoteDataSource.getCreateCurrentUserDataSource(user);

  @override
 String getCurrentUIdContract()  => baseFirebaseRemoteDataSource.getCurrentUIdDataSource();

 

  @override
 bool isSignInContract()  =>  baseFirebaseRemoteDataSource.isSignInDataSource();
 


}
