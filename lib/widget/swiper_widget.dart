//import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'NavigateContent.dart';

class MySwiperCard extends StatelessWidget{

  final ctrlSwipe = new SwiperController();

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context,int index){
        print("Swiper index:$index");
        return
        Card(
            color: index % 2 == 0 ? Colors.amberAccent : Colors.blueAccent,
            margin: EdgeInsets.all(20),
            child: Container(
              //child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,),
              child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.contain,),
              //child: Text("Hello $index"),

            )



        );
      },
      itemCount: 6,
      itemWidth: 300.0,
      itemHeight: 400.0,
      viewportFraction: 0.9,
      scale: 0.9,
      //layout: SwiperLayout.TINDER,
      //layout: SwiperLayout.STACK
      //pagination: new SwiperPagination( ),

      pagination:new SwiperCustomPagination(
          builder:(BuildContext context, SwiperPluginConfig config){
            var indx = config.activeIndex;
            print("Currn is $indx");
            //return Text("Currn is $indx");
            return NavigateContent(
              controller: ctrlSwipe,
              itemCount: 6,
              onSectionSelected: (int page) {
                print("SI: $page");
                ctrlSwipe.move(page);
              },
            );
          }
      ),

      //control: ctrlSwipe,
      controller: ctrlSwipe,
        //ctrlSwipe.move(3, true);
    );
  }

}

