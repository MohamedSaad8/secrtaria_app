import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:secrtaria/authentication_module/data/data_repo_imp/fire_base_user_repository_imp.dart';
import 'package:secrtaria/authentication_module/data/data_source/base_firebase_remote_data_source.dart';
import 'package:secrtaria/authentication_module/domain/repository/base_fire_base_user_repository.dart';
import 'package:secrtaria/onboearding_module/data/Repository/page_view_repo_imp.dart';
import 'package:secrtaria/onboearding_module/data/data_source/page_view_assets_data_source.dart';
import 'package:secrtaria/onboearding_module/domain/repository/base_page_view_repository.dart';
import '../../authentication_module/data/data_source/fire_base_remote_data_source.dart';
import '../../authentication_module/domain/usecase/forgot_password_usecase.dart';
import '../../authentication_module/domain/usecase/get_all_users_usecase.dart';
import '../../authentication_module/domain/usecase/get_create_current_user_usecase.dart';
import '../../authentication_module/domain/usecase/get_current_uid_usecase.dart';
import '../../authentication_module/domain/usecase/get_update_user_usecase.dart';
import '../../authentication_module/domain/usecase/google_sign_in_usecase.dart';
import '../../authentication_module/domain/usecase/is_sign_in_usecase.dart';
import '../../authentication_module/domain/usecase/sign_in_usecase.dart';
import '../../authentication_module/domain/usecase/sign_out_usecase.dart';
import '../../authentication_module/domain/usecase/sign_up_usecase.dart';
import '../../onboearding_module/domain/usecases/create_page_view_item_usecase.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {

  void serviceLocatorCaller()
  {
    pageViewDependencyInjectionSetup();
    authenticationDependencyInjectionSetup() ;
  }




  void pageViewDependencyInjectionSetup() {

     //* USECASES
      getIt.registerLazySingleton<CreatePageViewItemUseCase>(
      () => CreatePageViewItemUseCase(basePageViewRepository: getIt())); 

    //* DATA SOURCE
    getIt.registerLazySingleton<BasePageViewAssetsDataSource>(
        () => PageViewAssetsDataSource());

    //* REPOSITORY
    getIt.registerLazySingleton<BasePageViewRepository>(
        () => PageViewRepoImp(basePageViewAssetsDataSource: getIt()));

    
  }


  void authenticationDependencyInjectionSetup()
  {

      //* UseCases
       getIt.registerLazySingleton<GoogleSignInUseCase>(
          () => GoogleSignInUseCase(baseFireBaseUserRepository: getIt.call()));

       getIt.registerLazySingleton<ForgotPasswordUseCase>(
          () => ForgotPasswordUseCase(baseFireBaseUserRepository: getIt.call()));
          
       getIt.registerLazySingleton<GetCreateCurrentUserUseCase>(
          () => GetCreateCurrentUserUseCase(baseFireBaseUserRepository: getIt.call()));
          
       getIt.registerLazySingleton<GetCurrentUIDUseCase>(
          () => GetCurrentUIDUseCase(baseFireBaseUserRepository: getIt.call()));
          
       getIt.registerLazySingleton<IsSignInUseCase>(
          () => IsSignInUseCase(baseFireBaseUserRepository: getIt.call()));
          
      getIt.registerLazySingleton<SignInUseCase>(
          () => SignInUseCase(baseFireBaseUserRepository: getIt.call()));
          
      getIt.registerLazySingleton<SignUpUseCase>(
          () => SignUpUseCase(baseFireBaseUserRepository: getIt.call()));
          
      getIt.registerLazySingleton<SignOutUseCase>(
          () => SignOutUseCase(baseFireBaseUserRepository: getIt.call()));
          
      getIt.registerLazySingleton<GetAllUsersUseCase>(
          () => GetAllUsersUseCase(baseFireBaseUserRepository: getIt.call()));
          
      getIt.registerLazySingleton<GetUpdateUserUseCase>(
          () => GetUpdateUserUseCase(baseFireBaseUserRepository: getIt.call()));


      //* repositories

      getIt.registerLazySingleton<BaseFireBaseUserRepository>(
          () => FireBaseUserRepositoryImp(fireBaseRemoteDataSource: getIt.call()));

  
       getIt.registerLazySingleton<BaseFirebaseRemoteDataSource>(
          () => FireBaseRemoteDataSource(auth: getIt.call()  , fireStore: getIt.call() , googleSignIn:getIt.call() ));

 

        //* FireBase

        final auth = FirebaseAuth.instance;
        final fireStore = FirebaseFirestore.instance;
        final GoogleSignIn googleSignIn = GoogleSignIn();

        getIt.registerLazySingleton(() => auth);
        getIt.registerLazySingleton(() => fireStore);
        getIt.registerLazySingleton(() => googleSignIn);
  }
  
}
