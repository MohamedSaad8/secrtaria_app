import 'package:get_it/get_it.dart';
import 'package:secrtaria/onboearding_module/data/Repository/page_view_repo_imp.dart';
import 'package:secrtaria/onboearding_module/data/data_source/page_view_assets_data_source.dart';
import 'package:secrtaria/onboearding_module/domain/repository/base_page_view_repository.dart';
import '../../onboearding_module/domain/usecases/create_page_view_item_usecase.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {

  void setup() {

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
}
