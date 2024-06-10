import 'package:flutter/material.dart';
import 'package:news_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/Sports.dart';
import 'package:news_app/modules/favorite_screen.dart';
import 'package:news_app/modules/home_screen.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/search_screen.dart';
import 'package:news_app/modules/Science.dart';
import 'package:news_app/modules/settings_screen.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  // Bottom Navigation Bar
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(NewsChangeBottomNavState());
  }

  //General news
  List<dynamic> general = [];
  void getGeneral() {
    emit(NewsGetGeneralLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'category': 'general',
      'country': 'us',
      'apiKey': '2871845932ca4f2c8e8a8594dada13d4',
    }).then((value) {
      general = value.data['articles'];
      emit(NewsGetGeneralSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetGeneralErrorState(error.toString()));
    });
  }

  //Search News
  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search = [];
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'q': value,
      'apiKey': '2871845932ca4f2c8e8a8594dada13d4',
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'category': 'business',
      'country': 'us',
      'apiKey': '2871845932ca4f2c8e8a8594dada13d4',
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'category': 'sports',
      'country': 'us',
      'apiKey': '2871845932ca4f2c8e8a8594dada13d4',
    }).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'category': 'science',
      'country': 'us',
      'apiKey': '2871845932ca4f2c8e8a8594dada13d4',
    }).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  IconData iconLight = Icons.wb_sunny;
  IconData iconDark = Icons.nightlight;

  var light = ThemeMode.light;
  var dark = ThemeMode.dark;

  bool iconBool = true;

  changeIconMode() {
    iconBool = !iconBool;
    emit(ChangeIcon());
  }

  bool isDark = false;
  changemode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeAppMode());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppMode());
      });
    }
  }

}
