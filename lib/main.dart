import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_layout.dart';
import 'package:news_app/shared/bloc/blocObserver.dart';

import 'package:news_app/shared/bloc/newsCubit.dart';
import 'package:news_app/shared/bloc/newsStates.dart';
import 'package:news_app/shared/nwtwork/DioHelper.dart';
import 'package:news_app/shared/nwtwork/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.initDio();
  await CacheHelper.initShared();
  bool? status = await CacheHelper.getData(key: 'status');
  runApp(MyApp(
    status: status,
  ));
}

class MyApp extends StatelessWidget {
  final bool? status;

  const MyApp({this.status});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()
          ..getSports()
          ..changeSwitch(status),
        child: BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, states) {},
            builder: (context, states) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: AppBarTheme(
                      actionsIconTheme: IconThemeData(color: Colors.black),
                      titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarIconBrightness: Brightness.dark,
                          statusBarColor: Colors.white),
                      color: Colors.white,
                      elevation: 0.0,
                    )),
                darkTheme: ThemeData(

                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        backgroundColor: Colors.black45,
                        unselectedItemColor: Colors.grey),
                    scaffoldBackgroundColor: Colors.black45,
                    appBarTheme: AppBarTheme(

                      actionsIconTheme: IconThemeData(color: Colors.white,),
                      titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarIconBrightness: Brightness.light,
                          statusBarColor: Colors.black45),
                      color: Colors.black45,
                      elevation: 0.0,
                    )),
                themeMode: NewsCubit.get(context).status == null ||
                        NewsCubit.get(context).status == false
                    ? ThemeMode.light
                    : ThemeMode.dark,
                home: NewsLayout(),
              );
            }));
  }
}
