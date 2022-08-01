import 'package:secrtaria/onboearding_module/domain/entities/page_view_entity.dart';
import 'package:secrtaria/onboearding_module/domain/repository/base_page_view_repository.dart';

class CreatePageViewItemUseCase {

  BasePageViewRepository basePageViewRepository ;
  CreatePageViewItemUseCase({
    required this.basePageViewRepository,
  });

  List<PageViewEntity> execute()
  {
    return basePageViewRepository.createPageViewItems() ;
  }
  


}
