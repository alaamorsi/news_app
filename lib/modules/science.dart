import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).science;
          return Scaffold(
            appBar: AppBar(),
            body: articleBuilder(list, context),
          );
        });
  }
}
