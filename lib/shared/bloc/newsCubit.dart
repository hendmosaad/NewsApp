import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Modules/business/business.dart';
import 'package:news_app/Modules/scinces/scinces.dart';
import 'package:news_app/Modules/sports/sports.dart';
import 'package:news_app/shared/bloc/newsStates.dart';
import 'package:news_app/shared/nwtwork/DioHelper.dart';
import 'package:news_app/shared/nwtwork/cache_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(initialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool status = false;

  List<Widget> screens = [
    Sports(),
    Science(),
    Business(),
  ];
  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];
  List<dynamic> search = [];

  changeSwitch(value) {
    if (value != null) {
      status = value;
      CacheHelper.putData(key: 'status', value: status).then((value) {
        emit(changeSwitchState());
      });
    } else {
      status = true;
    }
  }
  changeNavBar(int x) {
    currentIndex = x;
    if (currentIndex == 0) {
      getSports();
    } else if (currentIndex == 1) {
      getScince();
    } else if (currentIndex == 2) {
      getBusiness();
    }
    print(currentIndex);
    emit(changeNavBarState());
  }


  void getBusiness() {
    emit(GetBusinessLoading());
    DioHelper.getData(path: 'v2/top-headlines', quires: {
      'country': 'us',
      'category': 'business',
      'apiKey': 'b0312cc08f154a60a2284087a7095658',
    }).then((value) {
      print(value.data['articles'].runtimeType);
      emit(GetBusinessSuccess());
      business = value.data['articles'];
      print(business[1]['url'].runtimeType);
    }).catchError((onError) {
      print('get business${onError}');
      emit(GetBusinessError());
    });
  }

  void getScince() {
    emit(GetScienceLoading());
    DioHelper.getData(path: 'v2/top-headlines', quires: {
      'country': 'us',
      'category': 'science',
      'apiKey': 'b0312cc08f154a60a2284087a7095658',
    }).then((value) {
      print(value.data['articles'].runtimeType);
      emit(GetScienceSuccess());
      science = value.data['articles'];
    }).catchError((onError) {
      print('get scince${onError}');
      emit(GetScienceError());
    });
  }

  void getSports() {
    emit(GetSportsLoading());
    DioHelper.getData(path: 'v2/top-headlines', quires: {
      'country': 'us',
      'category': 'sports',
      'apiKey': 'b0312cc08f154a60a2284087a7095658',
    }).then((value) {
      print(value.data['articles'].runtimeType);
      emit(GetSportsSuccess());
      sports = value.data['articles'];
    }).catchError((onError) {
      print('get business${onError}');
      emit(GetSportsError());
    });
  }


  void getSearch(String value) {
    emit(GetSearchLoading());
    DioHelper.getData(path: 'v2/everything', quires: {
      'q': '${value}',
      'apiKey': 'b0312cc08f154a60a2284087a7095658'
    }).then((value) {
      search = value.data['articles'];
      emit(GetSearchSuccess());
    }).catchError((onError) {
      print(onError);
      emit(GetSearchSuccess());
    });
  }
}
