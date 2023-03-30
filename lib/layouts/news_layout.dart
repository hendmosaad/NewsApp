import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:news_app/Modules/searchScreen/serach_screen.dart';
import 'package:news_app/shared/bloc/newsCubit.dart';
import 'package:news_app/shared/bloc/newsStates.dart';

class NewsLayout extends StatelessWidget {
  NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
            appBar: AppBar(
              title: Text('News Screen'),
              actions: [
                FlutterSwitch(
                  value: NewsCubit.get(context).status,
                  onToggle: (value) {
                    NewsCubit.get(context).changeSwitch(value);
                  },
                  height: 20,
                  width: 60,
                  activeColor: Colors.purple,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchSceen()));
                    },
                    icon: Icon(
                      Icons.search,
                      color:NewsCubit.get(context).status==false||NewsCubit.get(context).status==null? Colors.black: Colors.white,
                    ))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: NewsCubit.get(context).currentIndex,
              showUnselectedLabels: false,
              selectedItemColor: Colors.purple,
              onTap: (index) {
                NewsCubit.get(context).changeNavBar(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: 'sports'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: 'Scince'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: 'business'),
              ],
            ),
            body: NewsCubit.get(context)
                .screens[NewsCubit.get(context).currentIndex],
          );
        });
  }
}
