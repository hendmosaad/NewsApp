import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/web_view.dart';


Widget newsItem(articles,status,context,String url,index)=>
    InkWell(
      onDoubleTap: (){
        print('inkwell ${index}');
        Navigator.push(context,MaterialPageRoute(builder: (context)=>WebViewScreen(articles[index]['${url}'])));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 100,
              width: 100,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10)
              ),
              child: Image(image:
              NetworkImage('${
              articles['urlToImage']
              }')
                ,fit:BoxFit.cover ,),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded  (child:Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${articles['title']}',maxLines: 3,overflow: TextOverflow.ellipsis,style: status?TextStyle(color: Colors.white):TextStyle(color: Colors.black,),),
                SizedBox(height: 20,),
                Text('${articles['publishedAt']}',style: TextStyle(color: Colors.grey),),
              ],
            ))
          ],
        ),
      ),
    );