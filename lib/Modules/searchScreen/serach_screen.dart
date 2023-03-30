import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component/widgets.dart';
import 'package:news_app/shared/bloc/newsCubit.dart';
import 'package:news_app/shared/bloc/newsStates.dart';

class SearchSceen extends StatelessWidget {

  SearchSceen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search;
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(

              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        NewsCubit.get(context).getSearch(value);
                      },
                      decoration: InputDecoration(
                        label: Text(
                          'search',
                          style: NewsCubit.get(context).status
                              ? TextStyle(color: Colors.white)
                              : TextStyle(color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          gapPadding: 30,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ConditionalBuilder(
                      builder: (context) => ListView.separated(
                        itemCount: list.length,
                        itemBuilder: (context, index) => newsItem(
                            list[index], NewsCubit.get(context).status,context,list[index]['url'],index),
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 15, end: 15),
                          child: Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey,
                            padding: EdgeInsets.all(8.0),
                          ),
                        ),
                      ),
                      condition: list.length > 0,
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
       }
     }
