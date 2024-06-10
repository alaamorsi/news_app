import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).business;
          return Scaffold(
            appBar: AppBar(),
            body: articleBuilder(list, context),
          );
        });
  }
}
