import 'package:get_it/get_it.dart';
import 'package:secrtaria/authentication_module/data/data_repo_imp/fire_base_user_repository_imp.dart';
import 'package:secrtaria/authentication_module/data/data_source/base_firebase_remote_data_source.dart';
import 'package:secrtaria/authentication_module/domain/repository/base_fire_base_user_repository.dart';
import 'package:secrtaria/authentication_module/presentation/controller/auth_controller/auth_cubit.dart';
import 'package:secrtaria/onboearding_module/data/Repository/page_view_repo_imp.dart';
import 'package:secrtaria/onboearding_module/data/data_source/page_view_assets_data_source.dart';
import 'package:secrtaria/onboearding_module/domain/repository/base_page_view_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../authentication_module/data/data_source/fire_base_remote_data_source.dart';
import '../../authentication_module/domain/usecase/get_create_current_user_usecase.dart';
import '../../authentication_module/domain/usecase/get_current_uid_usecase.dart';
import '../../authentication_module/domain/usecase/is_sign_in_usecase.dart';
import '../../authentication_module/domain/usecase/sign_in_usecase.dart';
import '../../authentication_module/domain/usecase/sign_out_usecase.dart';
import '../../authentication_module/domain/usecase/sign_up_usecase.dart';
import '../../onboearding_module/domain/usecases/create_page_view_item_usecase.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {

  void serviceLocatorSetUp()
  {
     //* USECASES
      getIt.registerLazySingleton<CreatePageViewItemUseCase>(
      () => CreatePageViewItemUseCase(basePageViewRepository: getIt())); 

    //* DATA SOURCE
    getIt.registerLazySingleton<BasePageViewAssetsDataSource>(
        () => PageViewAssetsDataSource());

    //* REPOSITORY
    getIt.registerLazySingleton<BasePageViewRepository>(
        () => PageViewRepoImp(basePageViewAssetsDataSource: getIt()));

//* *****************************************************************************


      //*Cubits
    getIt.registerLazySingleton<AuthCubit>(
      () => AuthCubit(isSignInUseCase: getIt(), currentUIDUseCase: getIt(), signOutUseCase: getIt())
    );

       //* UseCases 
          
       getIt.registerLazySingleton<GetCreateCurrentUserUseCase>(
          () => GetCreateCurrentUserUseCase(baseFireBaseUserRepository: getIt()));
          
       getIt.registerLazySingleton<GetCurrentUIDUseCase>(
          () => GetCurrentUIDUseCase(baseFireBaseUserRepository: getIt()));
          
       getIt.registerLazySingleton<IsSignInUseCase>(
          () => IsSignInUseCase(baseFireBaseUserRepository: getIt()));
          
      getIt.registerLazySingleton<SignInUseCase>(
          () => SignInUseCase(baseFireBaseUserRepository: getIt()));
          
      getIt.registerLazySingleton<SignUpUseCase>(
          () => SignUpUseCase(baseFireBaseUserRepository: getIt()));
          
      getIt.registerLazySingleton<SignOutUseCase>(
          () => SignOutUseCase(baseFireBaseUserRepository: getIt()));
          



      //*Data Source 

      getIt.registerLazySingleton<BaseFirebaseRemoteDataSource>(
          () => FireBaseRemoteDataSource());


      //* repositories

      getIt.registerLazySingleton<BaseFireBaseUserRepository>(
          () => FireBaseUserRepositoryImp( baseFirebaseRemoteDataSource: getIt()));

  
      

  }

}
