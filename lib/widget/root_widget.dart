import 'dart:async';
import 'package:flutter/material.dart';

// Std BLoC includes
import 'package:flutter_bloc/flutter_bloc.dart';

// App BLoC includes
import 'package:mxsa1905/bloc/theme_bloc.dart';
import 'package:mxsa1905/bloc/counter_bloc.dart';

// App event imports
import 'package:mxsa1905/event/counter_event.dart';

// See Counter_page_widget.dart for design
// UI which captures the Action, will be under a function. As it along can change
// Similar for the UIs which is usd to display.
// rx -> receive, tx->transmit, action-> from user, disp->display to user
// in-> file input, data input, out->file out put, log out

//class RootAction extends AnimatedWidget //StatelessWidget
class RootLeftBar extends StatelessWidget
{
  final counterBloc;
  final themeBloc;

  RootLeftBar({this.counterBloc, this.themeBloc});

  // BUILD: Start point
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      color: Color(0xFFa6a6a6), // A, R, G, B
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          actionIncrement(counterBloc),
          //Padding(
          //  padding: EdgeInsets.symmetric(vertical: 5.0),
          //  child: actionIncrement(counterBloc),
          //),
          //Padding(
          //  padding: EdgeInsets.symmetric(vertical: 5.0),
          //  child: actionDecrement(counterBloc),
          //),
          //Padding(
          //  padding: EdgeInsets.symmetric(vertical: 5.0),
          //  child: actionTheme(themeBloc),
          //),
        ],
      ),
    );
  }
  // INPUT Widgets
  Widget actionIncrement(CounterBloc _counterBloc) {
    return FlatButton (
        onPressed: () { _counterBloc.dispatch(CounterEvent.increment); },
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide( //                   <--- left side
              //color: Colors.black,
              color: Color(0xFFe6e6e6),
              width: 2.0,
            ),
          ),
        ),
//        width: 80,
        height: 50,
        child: Row(children: <Widget>[
        Expanded(child: Container(child: Column(children: <Widget>[ Icon(Icons.add), Text("Add") ],),),),
        Container(color: Colors.red, width: 5,)
      ], ), ),
    );
  }

  Widget actionDecrement(CounterBloc _counterBloc) {
    return FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: () { _counterBloc.dispatch(CounterEvent.decrement); },
    );
  }

  Widget actionTheme(ThemeBloc _themeBloc) {
    return FloatingActionButton(
      child: Icon(Icons.update),
      onPressed: () { _themeBloc.dispatch(ThemeEvent.toggle); },
    );
  }


}
class RootRightBar extends StatelessWidget
{
  final counterBloc;
  final themeBloc;

  RootRightBar({this.counterBloc, this.themeBloc});

  // INPUT Widgets
  Widget actionIncrement(CounterBloc _counterBloc) {
    //return FloatingActionButton
    return FlatButton (
        child: Icon(Icons.add),
        onPressed: () {
          /// Takes an [Event] and triggers `mapEventToState`.
          /// `Dispatch` may be called from the presentation layer or from within the [Bloc].
          /// `Dispatch` notifies the [Bloc] of a new [Event].
          _counterBloc.dispatch(CounterEvent.increment);
        }
    );
  }

  Widget actionDecrement(CounterBloc _counterBloc) {
    return FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: () { _counterBloc.dispatch(CounterEvent.decrement); },
    );
  }

  Widget actionTheme(ThemeBloc _themeBloc) {
    return FloatingActionButton(
      child: Icon(Icons.update),
      onPressed: () { _themeBloc.dispatch(ThemeEvent.toggle); },
    );
  }

  // BUILD: Start point
  @override
  Widget build(BuildContext context) {
    //final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    //final ThemeBloc _themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Container(
      color: Colors.grey,

      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            //width: 120.0,
            //height: 30.0,
            child: RaisedButton(
              onPressed: (){
                print("Pressed Raised Button");
                counterBloc.dispatch(CounterEvent.decrement);},//
              color: Color(0XFFFF0000),
              child: Row(
                children: <Widget>[
                  Text('Play this song', style: TextStyle(color: Colors.white),),
                  Icon(Icons.play_arrow, color: Colors.white,),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child:
            GestureDetector(
              onTap: (){counterBloc.dispatch(CounterEvent.increment);},
              //onTap: actionIncrement(counterBloc),

              //     () {
              //   return actionIncrement(counterBloc);
              //   //setState(() { _lights = true; });
              // },
              child: Container(
                color: Colors.yellow,
                child: Text('TURN LIGHTS ON'),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            //child: FlatButton.icon(onPressed: null, icon: Icons.ac_unit, label: null),
            child: FlatButton.icon(onPressed: null, icon: Icon(Icons.message), label: Text("Hello")),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            //child:    RaisedButton.icon(onPressed: null, icon: null, label: null),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: actionIncrement(counterBloc),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: actionDecrement(counterBloc),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: actionTheme(themeBloc),
          ),
        ],
      ),
    );
  }
}


class RootContent extends StatelessWidget {
  final counterBloc;
  final themeBloc;

  RootContent({this.counterBloc, this.themeBloc});

   // DISPLAY / OUT Widget
  Widget displayCounter(int count) {
    return Center(
      child: Text( '$count', style: TextStyle(fontSize: 24.0), ),
    );
  }

  // BUILD: Start point
  @override
  Widget build(BuildContext context) {
print("In content");
    return
      //Text("Second");
      Expanded(
      child: Container(
        color: Colors.white,
          margin: EdgeInsets.fromLTRB(10, 30, 10, 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 BlocBuilder<CounterEvent, int>(
                   bloc: counterBloc,
                   builder: (BuildContext context, int count) {
                     return displayCounter(count); },
                 ),

                Expanded(
                  child: Card(child: Text("Expanded"),),
                ),

                Text("third"),
              ]
          )
      ),
    );
  }
}

class RootWidget extends StatelessWidget {
  // BUILD: Start point
  @override
  Widget build(BuildContext context) {
    print("In RootWidget BUILD ====================");
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    final ThemeBloc _themeBloc = BlocProvider.of<ThemeBloc>(context);
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        child: Row(
          children: <Widget>[
            RootLeftBar( counterBloc: _counterBloc, themeBloc: _themeBloc ),
            RootContent( counterBloc: _counterBloc, themeBloc: _themeBloc ),
            //RootRightBar( counterBloc: _counterBloc, themeBloc: _themeBloc ),
          ]
        ) ,
      ),
    );
  }
}
