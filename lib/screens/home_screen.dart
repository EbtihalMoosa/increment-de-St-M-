import 'package:darklightmode/cubits/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // متغير قيمته الاوليه صفر
  int counter = 0;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),

        // title: Text(i.toString()),
      ),
      body: Column(
        children: [
          // الودجت اللي اريد اغير فيها
          //1. bloc Builder
          //2. or bloc Consumer
          BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              return Text(MainCubit.get(context).counter.toString());
            },
          ),
          ElevatedButton(
              onPressed: () {
                MainCubit.get(context).increment();
                // counter++;
                // setState(() {});
              },
              child: Text("+")),

          ElevatedButton(
              onPressed: () {
                MainCubit.get(context).decrement();

                // counter--;
                // setState(() {
                //   //update for bulid function
                // });
              },
              child: Text("-")),
        ],
      ),
    );
  }
}
