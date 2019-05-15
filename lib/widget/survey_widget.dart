import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'swiper_widget.dart';
import 'navigate_content.dart';

class SurveyWidget extends StatelessWidget{
  final posL;

  final ctrlSwipe = new SwiperController();

  SurveyWidget({this.posL});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container (
                  //color: position % 2 == 0 ? Colors.pink : Colors.cyan,

                  child: Container(
                    //margin: EdgeInsets.fromLTRB(posL, 15, 0, 0),
                    margin: EdgeInsets.fromLTRB(posL, 0, 0, 0),
                    decoration: BoxDecoration(
                      border: Border.all( color: Color(0xFF000000), width: 2.0, ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: height * 0.1,
                          width: width, //width - sectionBarWidth,
                          child: Text("Title"),
                          decoration: BoxDecoration(
                            border: Border.all( color: Color(0xFF000000), width: 1.0, ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            width: width,// - sectionBarWidth,
                            decoration: BoxDecoration(
                              border: Border.all( color: Color(0xFF000000), width: 1.0, ),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  //margin: EdgeInsets.fromLTRB(0, 0, 250, 0),
                                  height: height * 0.75,
                                  width: width - 250, //- sectionBarWidth
                                  child: MySwiperCard(),
                                  //child: Text("body"),
                                  decoration: BoxDecoration(
                                    border: Border.all( color: Color(0xFF000000), width: 1.0, ),
                                  ),
                                ),
                                Positioned(
                                  left: width - 250, //- sectionBarWidth
                                  width: 100,
                                  height: height * 0.75,
                                  child: Container(
                                    height: height,
                                    width: width * 0.08,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      border: Border.all(
                                        color: Color(0xFF000000),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Text("Tool bar"),
                                  ),
                                ),

                               Positioned(
                                  left: width - 150, //sectionBarWidth - 250 + 100,
                                  width: 100,
                                  height: height * 0.75,
                                  child: Container(
                                    height: height, //sectionBarHeight,
                                    width: width, //sectionBarWidth,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      border: Border.all(
                                        color: Color(0xFF000000),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Text("Bar2."),
                                  ),
                                ),

                              Positioned(
                                left: 0, //sectionBarWidth,
                                bottom: 0, //sectionBarWidth,
                                child:
                                Container(

                                  height: height * 0.15,
                                  width: width - posL,// - sectionBarWidth,
                                  child: Text("Pagination"),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    border: Border.all( color: Color(0xFF000000), width: 1.0, ),
                                  ),
                                ),
                              ),

                              ],
                            )
                          ),
                        ),

                       // Container(
                       //   height: height * 0.15,
                       //   width: width - sectionBarWidth,
                       //   child: Text("Footer"),
                       //   decoration: BoxDecoration(
                       //     border: Border.all( color: Color(0xFF000000), width: 1.0, ),
                       //   ),
                       // ),
                      ],
                    ),
                  )
              );

  }

}
