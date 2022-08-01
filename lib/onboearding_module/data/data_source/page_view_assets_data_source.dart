import 'package:secrtaria/onboearding_module/data/models/page_view_model.dart';

abstract class BasePageViewAssetsDataSource{
    List<PageViewModel> getPageViewItemDataSource() ;
}

class PageViewAssetsDataSource extends BasePageViewAssetsDataSource
{
  @override
  List<PageViewModel> getPageViewItemDataSource() {
    return const [
      PageViewModel(
        imagePath:"assets/images/secrtaria.png" ,
        title: "Secrtaria Services",
        description: "Secrtaria is your electronic manager that organizes for you many important daily services",
      ),

       PageViewModel(
        imagePath:"assets/images/chats-logo.png" ,
        title: "Chatting Service",
        description: "Secrtaria allow you to chat with your friends and send to them many types of messages such as text , audio and image messages",
      ),

       PageViewModel(
        imagePath:"assets/images/calls_logo.png" ,
        title: "Audio & Video Calls Service",
        description: "Secrtaria allow you to call with your friends video ar audio calls and this service free",
      ),

       PageViewModel(
        imagePath:"assets/images/audio_logo.png" ,
        title: "Music Player Service",
        description: "Secrtaria allow you to hear a nice music from your device and it can play in background thats mean you can use all services during music playing",
      ),

        PageViewModel(
        imagePath:"assets/images/Cinema-logo.png" ,
        title: "Cinema Service",
        description: "Secrtaria allow you to choose you favorite movie and you can watch it in a nice time",
      ),
        PageViewModel(
        imagePath:"assets/images/weather-logo.png" ,
        title: "Weather State Service",
        description: "Secrtaria notify you by weather state in your country our in your Current location and also you can search for special place",
      ),
        PageViewModel(
        imagePath:"assets/images/Notes-Logo.png" ,
        title: "Notes & TODO Notifications",
        description: "Secrtaria allow you to note some notes and TODOs and allows notify you by the nots and TODOs",
      ),
        PageViewModel(
        imagePath:"assets/images/pray-times.png" ,
        title: "Pray Times",
        description: "Secrtaria notify you by pray times and play AZAN when time pray and it work in background",
      ),
        PageViewModel(
        imagePath:"assets/images/trend-logo.png" ,
        title: "Trends Service",
        description: "In Secrtaria you can know that is the trend in some places and reacted it",
      ),
        PageViewModel(
        imagePath:"assets/images/news-logo.png" ,
        title: "News Service",
        description: "In Secrtaria you can know your country News and all world country news",
      ),
    ] ;
  }

}