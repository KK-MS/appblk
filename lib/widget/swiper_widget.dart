//import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// BLoC
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigate_content.dart';

import 'package:mxsa1905/bloc/survey_bloc.dart';

import 'package:mxsa1905/widget/qa_card.dart';

class MySwiperCard extends StatelessWidget{

  //final ctrlSwipe = new SwiperController();
  final ctrlSwipe;

  MySwiperCard({this.ctrlSwipe});

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {

    final SurveyBloc _surveyBloc = BlocProvider.of<SurveyBloc>(context);


    return
      BlocBuilder(
        bloc: _surveyBloc,
        builder: (_, SurveyData surveyData)
    {
      return


        Swiper(
          itemBuilder: (BuildContext context, int index) {
            print("Swiper index:$index");

            return
              Card(
                  color: index % 2 == 0 ? Colors.amberAccent : Colors
                      .blueAccent,
                  margin: EdgeInsets.all(20),
                  child: Container(
                    //child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,),
                    //child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.contain,),
                    //child: Text("Hello $index : $strMainQ"),
                    child: QACard(cardIndex: index,),

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

          //pagination:new SwiperCustomPagination(
          //    builder:(BuildContext context, SwiperPluginConfig config){
          //      var indx = config.activeIndex;
          //      print("Currn is $indx");
          //      //return Text("Currn is $indx");
          //      return NavigateContent(
          //        controller: ctrlSwipe,
          //        itemCount: 6,
          //        onSectionSelected: (int page) {
          //          print("SI: $page");
          //          ctrlSwipe.move(page);
          //        },
          //      );
          //    }
          //),

          //control: ctrlSwipe,
          controller: ctrlSwipe,
          //ctrlSwipe.move(3, true);
        );
    }
    );
  }

}

