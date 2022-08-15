import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secrtaria/home_module/presentation/controller/home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(ChatState());
  Widget currentScreen = Container(
    color: Colors.red,
  );
  int currentIndex = 0;

  void changePageIndex(int newPageIndex) {
    currentIndex = newPageIndex;
    switch (newPageIndex) {
      case 0:
        {
          emit(ChatState());
          break;
        }
      case 1:
        {
          emit(MusicPlayerState());
          break;
        }
      case 2:
        {
          emit(CinemaState());
          break;
        }
      case 3:
        {
          emit(WeatherState());
          break;
        }
      case 4:
        {
          emit(NotesAndTODOState());
          break;
        }
      case 5:
        {
          emit(PrayTimesState());
          break;
        }
      case 6:
        {
          emit(TrendsState());
          break;
        }
      case 7:
        {
          emit(NewsState());
          break;
        }
    }
  }
}
