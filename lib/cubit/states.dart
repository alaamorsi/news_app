abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

// Bottom Nav state
class NewsChangeBottomNavState extends NewsStates {}

//General states
class NewsGetGeneralLoadingState extends NewsStates {}

class NewsGetGeneralSuccessState extends NewsStates {}

class NewsGetGeneralErrorState extends NewsStates {
  final String error;

  NewsGetGeneralErrorState(this.error);
}
//Business states
class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error;

  NewsGetBusinessErrorState(this.error);
}
//Science states
class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error;

  NewsGetScienceErrorState(this.error);
}

//Sports states
class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String error;

  NewsGetSportsErrorState(this.error);
}
//Search states

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String error;

  NewsGetSearchErrorState(this.error);
}
//theme data
class ChangeIcon extends NewsStates{}
class ChangeAppMode extends NewsStates{}
