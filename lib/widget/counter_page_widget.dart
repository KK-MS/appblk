import 'dart:async';
import 'package:flutter/material.dart';

// Std BLoC includes
import 'package:flutter_bloc/flutter_bloc.dart';

// App BLoC includes
import 'package:mxsa1905/bloc/theme_bloc.dart';
import 'package:mxsa1905/bloc/counter_bloc.dart';

// App event imports
import 'package:mxsa1905/event/counter_event.dart';
// Design: The first layer of the widget will be in function
// and its child will be a function.
// reason: First layer will be position, colored, defined as per requirement.
// OR
// Seperate each widget as a function ! AND
// Related widgets function are in the same class
// OR
// UI which captures the Action, will be under a function. As it along can change
// Similar for the UIs which is usd to display.
// rx -> receive, tx->transmit, action-> from user, disp->display to user
// in-> file input, data input, out->file out put, log out

class CounterPageWidget extends StatelessWidget {
  // DISPLAY / OUT Widget
  Widget displayCounter(int count) {
    return Center(
      child: Text( '$count', style: TextStyle(fontSize: 24.0), ),
    );
  }
  Widget displayCounterListenerWidget() {
    print("In displayCounterListenerWidget ");
    return Container(width: 80, height: 80,
              color: Colors.red,
              // child: new Swiper(
              //   itemBuilder: (BuildContext context,int index){
              //     return Text("Hello");//new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
              //   },
              //   itemCount: 2,
              //   pagination: new SwiperPagination(),
              //   control: new SwiperControl(),
              // ),
            );
  }

  // INPUT Widgets
  Widget actionIncrement(CounterBloc _counterBloc) {
    return FloatingActionButton(
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

  // Listener. Not we can call a widget inside but should avoid.
  // Listener will be suited to transit to other Page, navigator.
  // If widget need to be provided, then user BlocBuilder

  listenCounterListenerWidget(context, state) {
      print("33Listener is called !state:$state");
      // //if (state is Success)
      // if (count == 5) {
      //   print("Listener is called !");
      //   Text('Press the Button');
      //   //Navigator.of(context).pushNamed('/details');
      // }
  }
  // BUILD: Start point
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    final ThemeBloc _themeBloc = BlocProvider.of<ThemeBloc>(context);
    // Note:
    // counterBloc is tied to widget, thus will not call build
    // themeBloc is not tied to widget, thus build will be called.

    print("In MxAPP BUILD ====================");
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Column(
        children: <Widget>[
          BlocBuilder<CounterEvent, int>(
            bloc: _counterBloc,
            builder: (BuildContext context, int count) {
              return displayCounter(count); },
          ),

          BlocListener(
            bloc: _counterBloc,
            listener:(context, state) {
              //listener: (context, int count)
              // cannot be assigned as assigning will say 'state' is undefined
              listenCounterListenerWidget(context, state);
              /// Note:
              // Listener. Now we can call a widget inside but should avoid.
              // It also has a child property where we can provide the child
              // widget
              // Listener will be suited to transition, e.g. to other Page,
              // navigator.
              // If widget need to be provided, then user BlocBuilder
              // Listener has both UI and Action/Event together.
              // Builder will be flexible as it can separate both.
            },
            child: displayCounterListenerWidget(),
          )
        ],
      ),

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: actionIncrement(_counterBloc),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: actionDecrement(_counterBloc),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: actionTheme(_themeBloc),
          ),
        ],
      ),
    );
  }
}
