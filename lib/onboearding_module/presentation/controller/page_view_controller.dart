import 'package:get/get.dart';
import '../../../core/services/service_locator.dart';
import '../../domain/entities/page_view_entity.dart';
import '../../domain/usecases/create_page_view_item_usecase.dart';

class PageViewController extends GetxController {
 
List<PageViewEntity> listOfPageViewItemsData =
        getIt<CreatePageViewItemUseCase>().execute();

int indicatorIndex  = 0;


 void changeIndicatorIndex({required int newIndexValue})
 {
    indicatorIndex = newIndexValue ;
    update();
 }

}