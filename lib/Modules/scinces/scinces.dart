import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/component/widgets.dart';
import 'package:news_app/shared/bloc/newsCubit.dart';
import 'package:news_app/shared/bloc/newsStates.dart';
class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,states){},
      builder:(context,states){
        var list=NewsCubit.get(context).science;
        return Scaffold(
            body:ConditionalBuilder(
              builder: (context)=>ListView.separated(
                itemCount: list.length,
                itemBuilder: (context,index)=>newsItem(list[index],NewsCubit.get(context).status,context,list[index]['url'],index),
                separatorBuilder: (context,index)=> Padding(
                  padding: const EdgeInsetsDirectional.only(start: 15,end: 15),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
                    padding: EdgeInsets.all(8.0),
                  ),
                ),
              ),
              condition:list.length>0 ,
              fallback:(context)=>Center(child: CircularProgressIndicator(),) ,
            )
        );
      } ,
    );
  }
}
