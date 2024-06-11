import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    defaultFormField(
                      context: context,
                      controller: searchController,
                      type: TextInputType.text,
                      onChanged: (value) {
                        NewsCubit.get(context).getSearch(value);
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Search must not be empty!';
                        }
                        return null;
                      },
                      label: 'Search',
                      prefix: Icons.search,
                    ),
                    GestureDetector(
                      onTap: () {
                        searchController.clear();
                        NewsCubit.get(context).getSearch('?_?_?');
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.clear),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: articleBuilder(list, context, isSearch: true))
            ],
          );
      },
    );
  }
}
