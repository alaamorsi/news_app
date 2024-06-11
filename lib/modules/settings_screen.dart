import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 5.0),
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0,color: Theme.of(context).unselectedWidgetColor),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Theme Mode : ',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                        const Spacer(),
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
