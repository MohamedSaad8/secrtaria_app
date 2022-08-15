import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secrtaria/core/constants/constant.dart';
import 'package:slidable_bar/slidable_bar.dart';
import '../controller/home_cubit.dart';
import '../controller/home_state.dart';
import '../widget/custom_clicker.dart';
import '../../../core/shared_methods/side_bar_items_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final SlidableBarController controller =
      SlidableBarController(initialStatus: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: SlidableBar(
          size: 65.w,
          slidableController: controller,
          barRadius: const BorderRadius.only(bottomRight: Radius.circular(10)),
          side: Side.left,
          duration: const Duration(milliseconds: 500),
          backgroundColor: Constant.clickerColor,
          curve: Curves.ease,
          clicker: const CustomClicker(),
          barChildren: getSideBarItemsList(),
          clickerPosition: 0.5,
          onChange: (int index) {
            BlocProvider.of<HomeCubit>(context).changePageIndex(index);
          },
          child: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case UserInfoState :{
                   return Container(
                      color: Colors.white,
                    );
                }
                case ChatState:
                  {
                    return Container(
                      color: Colors.white,
                    );
                  }
                case MusicPlayerState:
                  {
                    return Container(
                      color: Colors.yellow,
                    );
                  }
                case NotesAndTODOState:
                  {
                    return Container(
                      color: Colors.green,
                    );
                  }
                case TrendsState:
                  {
                    return Container(
                      color: Colors.orange,
                    );
                  }
                case PrayTimesState:
                  {
                    return Container(
                      color: Colors.pink,
                    );
                  }
                case NewsState:
                  {
                    return Container(
                      color: Colors.purple,
                    );
                  }
                case WeatherState:
                  {
                    return Container(
                      color: Colors.blue,
                    );
                  }
                case CinemaState:
                  {
                    return Container(
                      color: Colors.grey,
                    );
                  }
              }
              return Container(
                color: Colors.black,
              );
            },
          ),
        ),
      ),
    );
  }
}
