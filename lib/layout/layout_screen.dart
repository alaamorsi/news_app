import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/search_screen.dart';
import 'package:news_app/shared/components.dart';

class NewsLayoutScreen extends StatelessWidget {
  const NewsLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight/15),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25.0),bottomRight: Radius.circular(25.0)),
              child: AppBar(
                title: const Text(
                  'Egypt News',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                elevation: 5.0,
                shadowColor: Colors.black,
                // actions: [
                //   IconButton(onPressed: (){
                //     navigateTo(context, SearchScreen());
                //   }, icon: Icon(Icons.search_rounded)),
                //   IconButton(onPressed: () {
                //     cubit.changeIconMode();
                //     cubit.changemode();
                //   },
                //       icon: Icon(cubit.iconBool ? cubit.iconDark : cubit.iconLight)),
                // ],
              ),
            ),
          ),
          body: NewsCubit.get(context)
              .screens[NewsCubit.get(context).currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey.shade300,
                  color: Theme.of(context).unselectedWidgetColor,
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.search,
                      text: 'Search',
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Settings',
                    ),
                  ],
                  selectedIndex: NewsCubit.get(context).currentIndex,
                  onTabChange: (index) {
                    NewsCubit.get(context).changeBottomNav(index);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
