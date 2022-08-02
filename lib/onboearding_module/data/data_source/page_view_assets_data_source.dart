import 'package:get/get.dart';
import 'package:secrtaria/onboearding_module/data/models/page_view_model.dart';

abstract class BasePageViewAssetsDataSource{
    List<PageViewModel> getPageViewItemDataSource() ;
}

class PageViewAssetsDataSource extends BasePageViewAssetsDataSource
{
  @override
  List<PageViewModel> getPageViewItemDataSource() {
    return  [
      PageViewModel(
        imagePath:"assets/images/secrtaria.png" ,
        title: "secrtaria".tr,
        //title: "Secrtaria Services",
        description: "secrtariaServicesDescription".tr,
      ),

       PageViewModel(
        imagePath:"assets/images/chats-logo.png" ,
        title: "chattingService".tr,
        description: "chattingServiceDescription".tr,
      ),

        PageViewModel(
        imagePath:"assets/images/calls_logo.png" ,
        title: "callsService".tr ,
        description: "callsServiceDescription".tr,
      ),

        PageViewModel(
        imagePath:"assets/images/audio_logo.png" ,
        title: "musicPlayerService".tr,
        description: "musicPlayerServiceDescription".tr,
      ),

         PageViewModel(
        imagePath:"assets/images/Cinema-logo.png" ,
        title: "cinemaService".tr,
        description: "cinemaServiceDescription".tr,
      ),
         PageViewModel(
        imagePath:"assets/images/weather-logo.png" ,
        title: "weatherStateService".tr,
        description: "weatherStateServiceDescription".tr,
      ),
         PageViewModel(
        imagePath:"assets/images/Notes-Logo.png" ,
        title: "notsService".tr,
        description: "notsServiceDescription".tr,
      ),
         PageViewModel(
        imagePath:"assets/images/pray-times.png" ,
        title: "prayTimesService".tr,
        description: "prayTimesServiceDescription".tr,
      ),
         PageViewModel(
        imagePath:"assets/images/trend-logo.png" ,
        title: "trendsService".tr,
        description: "trendsServiceDescription".tr,
      ),
         PageViewModel(
        imagePath:"assets/images/news-logo.png" ,
        title: "newsService".tr,
        description: "newsServiceDescription".tr,
      ),
    ] ;
  }

}