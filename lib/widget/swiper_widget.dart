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
        itemWidth: 300.0,
        itemHeight: 400.0,
        viewportFraction: 0.9,
        scale: 0.8,
          //layout: SwiperLayout.TINDER,
          //layout: SwiperLayout.STACK
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }
}
class MySwiperCard extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Swiper(
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
      itemWidth: 300.0,
      itemHeight: 400.0,
      viewportFraction: 0.9,
      scale: 0.8,
      //layout: SwiperLayout.TINDER,
      //layout: SwiperLayout.STACK
      //pagination: new SwiperPagination(),
      //control: new SwiperControl(),
    );
  }
}
