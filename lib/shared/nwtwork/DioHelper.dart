import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper
{
  static Dio? dio;
  static void initDio(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true
      )
    );
  }
  static Future<Response> getData({
  required String path,
  required Map< String,dynamic> quires
})async{
  return await dio!.get(path,queryParameters: quires);
  }



}