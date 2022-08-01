// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:secrtaria/onboearding_module/data/data_source/page_view_assets_data_source.dart';
import 'package:secrtaria/onboearding_module/domain/entities/page_view_entity.dart';
import 'package:secrtaria/onboearding_module/domain/repository/base_page_view_repository.dart';

class PageViewRepoImp extends BasePageViewRepository {
 
 BasePageViewAssetsDataSource basePageViewAssetsDataSource ;
  PageViewRepoImp({
    required this.basePageViewAssetsDataSource,
  });
 
  @override
  List<PageViewEntity> createPageViewItems() {
   return basePageViewAssetsDataSource.getPageViewItemDataSource();
  }

}
