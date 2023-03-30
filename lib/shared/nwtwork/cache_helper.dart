import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
 static SharedPreferences? sharedPreferences;
 static initShared()async{
  sharedPreferences=await SharedPreferences.getInstance();
 }

static Future<bool> putData({required String key,required dynamic value})async{
  if(value is bool){
return await  sharedPreferences!.setBool(key, value);
  }
  else if(value is String){
 return await sharedPreferences!.setString(key, value);
  }
  else if(value is int){
   return await sharedPreferences!.setInt(key, value);
  }
  else{
return await  sharedPreferences!.setDouble(key, value);
  }
 }

static Future<dynamic> getData({required String key})
   async {
 return await sharedPreferences!.get(key);
}
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/shared/bloc/newsCubit.dart';
// import 'package:news_app/shared/bloc/newsStates.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// class WebViewScreen extends StatelessWidget {
//   const WebViewScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NewsCubit,NewsStates>(
//       listener: (context,state){},
//       builder: (context,state){
//         return Scaffold(
//             body:WebViewWidget(
//               controller: WebViewController()..loadRequest(Uri.parse('https://pub.dev/packages/webview_flutter')),
//
//             )
//         );
//       },
//     ) ;
//   }
// }
