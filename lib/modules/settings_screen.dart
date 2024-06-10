import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0,color: Colors.black),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Theme Mode : ',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            cubit.changeIconMode();
                            cubit.changemode();
                          },
                          icon: Icon(
                              cubit.iconBool ? cubit.iconDark : cubit.iconLight))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
