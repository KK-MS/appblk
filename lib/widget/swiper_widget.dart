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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body:  new Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}