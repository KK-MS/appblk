import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//void main() => runApp(new MySwiper());

class MySwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MySwiperHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MySwiperHomePage extends StatefulWidget {
  MySwiperHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySwiperHomePageState createState() => new _MySwiperHomePageState();
}

class _MySwiperHomePageState extends State<MySwiperHomePage> {

  @override
  Widget build(BuildContext context) {
    print("in building of Swiper ");
    return new
    //Scaffold
     Container
    //Card
      (
      //appBar: new AppBar(
      //  title: new Text(widget.title),
      //),
      //body:
      child:
      Swiper(
        itemBuilder: (BuildContext context,int index){
          return new
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
        itemCount: 10,
        //itemWidth: 300.0,
        //itemHeight: 400.0,
        viewportFraction: 0.8,
        scale: 0.9, // can provide a peaking feature with 0.9
          //layout: SwiperLayout.TINDER,
          //layout: SwiperLayout.STACK
        pagination: new SwiperPagination(
           // margin: new EdgeInsets.all(5.0),
          builder: SwiperPagination.dots,

        ),
        control: new SwiperControl(),
      ),
    );
  }
}
class MySwiperCard extends StatelessWidget{

  var swiperctrl = new SwiperController();

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
            return SectionIndicator(
              controller: swiperctrl,
              itemCount: 6,
              onSectionSelected: (int page) {
                print("SI: $page");
                swiperctrl.move(page);
              },
            );
          }
      ),

      //control: swiperctrl,
      controller: swiperctrl,
        //swiperctrl.move(3, true);
    );
  }

}

/// An indicator showing the currently selected page of a PageController
class SectionIndicator extends AnimatedWidget {
  SectionIndicator({
    this.controller,
    this.itemCount,
    this.onSectionSelected,
    //this.onSectionDoubleTap,
    this.color: Colors.grey, // dots color
    //this.usePageControl, // dots color
  }) : super(listenable: controller);

  /// The usePageControl is true when pages are built
  //final int usePageControl;

  /// The PageController that this DotsIndicator is representing.
  //final PageController controller;
  final SwiperController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onSectionSelected;

  /// Called when a dot is tapped
  ///final ValueChanged<int> onSectionDoubleTap;

  /// Defaults to `Colors.white`.
  final Color color;

  static Color dotColor; /// change color based on page navigation position

  // The base size of the dots
  static const double _kDotSize = 30.0; //8.0

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.4;

  static const double _kColorChange = _kMaxZoom * 0.8; // at

  // The distance between the center of each dot
  static const double _kDotSpacing = 80.0; //25.0

  static String strImgPath = "assets/images/";

  static List<List<String>> strOnOff = [
    // [ Not selected,  Selected ]
    ["home_36.png", "home_36.png"],
    ["edit_grey_36.png", "edit_red_36.png"],
    ["assist_grey_36.png", "assist_red_36.png"],
    ["question_grey_36.png", "question_red_36.png"],
    ["report_grey_36.png", "report_red_36.png"],
  ];

  Widget _buildDot(int index) {
    print("_buildDot Section  build: $index, ");
    //if (index == 0) {
    //  return new Container();
    //}

    // For animation of dot, i.e. size of dot based on the slide position
   // double selectedness = Curves.easeOut.transform(
   //   max(
   //     0.0,
   //     1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
   //   ),
   // );

   dotColor = color;
   // int    bSelected = 0;
   // double zoom      = 1.0 + (_kMaxZoom - 1.0) * selectedness;
   //
   // if (zoom > _kColorChange) {
   //   dotColor = Color.fromARGB(0xA0, 0xFF, 0x50, 0x50);//Colors.red;
   //   bSelected = 0;
   // }

    //String strImage = strImgPath + strOnOff[index][bSelected];
    //String strImage = strImgPath + strOnOff[index][0];
    String strImage = index.toString();

    return new Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        border: Border.all( color: Color(0xFF000000), width: 1.0, ),
      ),
      //height: _kDotSpacing,
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: dotColor, //color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize, // * zoom,
            height: _kDotSize, // * zoom,
            child: new InkWell(
              //onTap: () => onPageSelected(index),
              onTap: () {
                print("onTap index : $index, ");
                onSectionSelected(index);
              },
              child: Container(
                  padding: EdgeInsets.all(5.5),
                  //child: Image.asset(strImage)),
                child: Text(strImage)
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new
    //Column
    Row
      (
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
