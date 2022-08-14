import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secrtaria/home_module/controller/home_cubit.dart';
import 'package:secrtaria/home_module/controller/home_state.dart';
import 'package:slidable_bar/slidable_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final SlidableBarController controller =
      SlidableBarController(initialStatus: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidableBar(
        size: 60,
        frontColor: Colors.green,
        slidableController: controller,
        barRadius: BorderRadius.circular(10.0),
        side: Side.left,
        onChange: (int index) {
          BlocProvider.of<HomeCubit>(context).changePageIndex(index);
          
        },
        duration: const Duration(milliseconds: 500),
        backgroundColor: Colors.blue,
        curve: Curves.ease,
        clicker: const Icon(Icons.arrow_forward_ios),
        barChildren: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Icon(Icons.arrow_forward_ios),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Icon(Icons.arrow_forward_ios),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Icon(Icons.arrow_forward_ios),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Icon(Icons.arrow_forward_ios),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Icon(Icons.arrow_forward_ios),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Icon(Icons.arrow_forward_ios),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Icon(Icons.arrow_forward_ios),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Icon(Icons.arrow_forward_ios),
          ),
        ],
        child: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case ChatState:
                {
                  return Container(
                    color: Colors.red,
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
    );
  }
}
