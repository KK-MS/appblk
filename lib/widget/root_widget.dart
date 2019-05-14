import 'dart:async';
import 'package:flutter/material.dart';

// Std BLoC includes
import 'package:flutter_bloc/flutter_bloc.dart';

// App BLoC includes
import 'package:mxsa1905/bloc/theme_bloc.dart';
import 'package:mxsa1905/bloc/counter_bloc.dart';

// App event imports
import 'package:mxsa1905/event/counter_event.dart';

import 'swiper_widget.dart';
import 'NavigateSection.dart';
import 'survey_widget.dart';

// See Counter_page_widget.dart for design
// UI which captures the Action, will be under a function. As it along can change
// Similar for the UIs which is usd to display.
// rx -> receive, tx->transmit, action-> from user, disp->display to user
// in-> file input, data input, out->file out put, log out

class RootWidget extends StatelessWidget {
  // BUILD: Start point
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeIn;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery .of(context) .size .width;
    PageController ctrlPages = PageController(
      initialPage: 0,
      viewportFraction: 1.0,
      keepPage: true
    );
    print("In RootWidget");
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          color: Colors.greenAccent,
          child: PageView.builder(
            controller: ctrlPages,
            physics: new ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, position) {
              var pageColor = position % 2 == 0 ? Colors.pink : Colors.cyan;

              switch(position) {
                case 0:
                  return Container(
                    color: pageColor,
                    child: Text("Welcome : In position:$position"),
                  );
                  break;
                case 1:
                  return Container(
                    color: pageColor,
                    child: Text("Config: In position:$position"),
                  );
                  break;
                case 2:
                  return Container(
                    color: pageColor,
                    child: Text("Assist: In position:$position"),
                  );
                  break;
                case 3:
                  return Container(
                    color: pageColor,
                    child: SurveyWidget( posL: width * 0.08, ),
                  );
                  break;
                case 4:
                  return Container(
                    color: pageColor,
                    child: Text("Graph: In position:$position"),
                  );
                  break;
                default:
                  return Container(
                    color: pageColor,
                    child: Text("Error: In position:$position"),
                  );
              }

            },
          ),
        ),

        Positioned(
          left: 0,
          child: NavigateSection(
            controller: ctrlPages,
            itemCount: 5,
            onSectionSelected: (int page) {
              //ctrlPages.jumpToPage(page);
              // TODO: Add in BLoC function
              ctrlPages.animateToPage( page,
                  duration: _kDuration,
                  curve: _kCurve
              );
            },
          ),
        )
      ], )
    );
  }
}

//class RootAction extends AnimatedWidget //StatelessWidget
class RootLeftBar extends StatelessWidget {
  final counterBloc;
  final themeBloc;

  RootLeftBar({this.counterBloc, this.themeBloc});

  // BUILD: Start point
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("In RootLeftBar BUILD ===================$width");
    return Container(
      width: 80,
      height: height,

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
              color: Color(0xFFe6e6e6),
              width: 2.0,
            ),
          ),
        ),
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

  // BUILD: Start point
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print("In RootRightBar BUILD ===================$width");
    return Container(
      // color: Colors.grey,
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.blueAccent)
      ),
      child: Card (child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          actionIncrement(counterBloc),
          actionDecrement(counterBloc),
          actionTheme(themeBloc),
        ],
      ),
      ),
    );
  }
  // INPUT Widgets
  Widget actionIncrement(CounterBloc _counterBloc) {
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

}


class RootContent extends StatelessWidget {
  final counterBloc;
  final themeBloc;

  RootContent({this.counterBloc, this.themeBloc});

  // Outside build method
  PageController controller = PageController();


  // BUILD: Start point
  @override
  Widget build(BuildContext context) {
    print("In content");
    final List<Widget> _pages = <Widget> [
      Container( color: Colors.pink, ),
      Container( color: Colors.cyan, ),
      Container( color: Colors.deepPurple, ),
      //rootContentLayout(context),
      //rootContentLayout(context),
      //rootContentLayout(context),
    ];

    var height = MediaQuery.of(context).size.height;
    return Container(
        height: height,

        child: PageView.builder(
          scrollDirection: Axis.vertical,
          //physics: new ClampingScrollPhysics(),
          controller: controller,

          itemBuilder: (BuildContext context, int index) {
            //return _pages[index % _pages.length];
            return Container(
              color: index % 2 == 0 ? Colors.pink : Colors.cyan,
            );
          },
          //onPageChanged: (newPage) {
          //  int pgLen = _pages.length;
          //  if (newPage >= pgLen) {
          //    newPage = pgLen - 1;
          //    //doSectionSelected(newPage);
          //  }
          //}
        )
    ) ;
  }

  Widget rootContentLayout(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return //   Expanded(
      //child:
      Container(
        height: height,
        color: Colors.blueGrey,
        margin: EdgeInsets.fromLTRB(10, 30, 10, 5),
        // child: Row(
        //   children: <Widget>[
        //     Expanded (
        //       child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: <Widget>[
        //             rootHeader(context),
        //             rootBody(context),
        //             rootFooter(context)
        //           ]
        //       ),
        //     )
        //   ],
        // )
        //)
      );
  }
  // DISPLAY / OUT Widget
  Widget displayCounter(int count) {
    return Container(
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.blueAccent)
      ),
      child: Text( '$count', style: TextStyle(fontSize: 24.0), ),
    );
  }

  Widget rootHeader(BuildContext context) {
    return BlocBuilder<CounterEvent, int>(
      bloc: counterBloc,
      builder: (BuildContext context, int count) {
        return displayCounter(count);
      },
    );
  }

  Widget rootBody (BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Expanded(
        child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    height: height,// -200 ,
                    decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.blueAccent)
                    ),
                    child: Card(child: Text("Expanded"),),
                  )
              ),
              RootRightBar( counterBloc: counterBloc, themeBloc: themeBloc ),
            ]
        )
    );
  }

  Widget rootFooter (BuildContext context) {
    return Text("third");
  }

}


