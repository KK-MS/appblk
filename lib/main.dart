import 'dart:async';
import 'package:flutter/material.dart';

// Std BLoC imports
import 'package:bloc/bloc.dart';

// App specific imports
import 'package:mxsa1905/MxApp.dart';

class MxAppBlocDelegate extends BlocDelegate {
  /// Called whenever a [Transition] occurs with the given [Transition].
  /// A [Transition] occurs when a new [Event] is dispatched and 
  /// `mapEventToState` executed.
  /// `onTransition` is called before a [Bloc]'s [State] has been updated.
  /// A great spot to add logging/analytics.
  /// void onTransition(Transition<Event, State> transition)
  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);

    var event = transition.event;
    var currentState = transition.currentState;
    var nextState    = transition.nextState;

    print("    #main: onTransition --Start--(");
    print("    #main: event: $event");
    print("    #main: state:     $currentState");
    print("    #main: nextstate: $nextState");
    print("    #main: +onTransition ++End++)");
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor().delegate = MxAppBlocDelegate();
  runApp(MxApp());
}

// Layout
//
// 1 Container
//   3 row 
//     1-row. Full
//     2-row.
//       3-col.
//         1-title full
//         2-content   
//         3-status   
//     3-row.: Tools etc.

// RootWidget => Creates section pages along with its page navigation
// NavigateSection => Navigate section pages
//
// TODO send email
// https://pub.dev/packages/flutter_email_sender

// TODO Flutter Table layout with CSV data
// https://gist.github.com/Rahiche/9b4b2d3b5c24dddbbe662b58c5a2dcd2

// ASYNC
// Challenge: To read a file into the model data and then widget is created at
//            as fast as possible.
// Method-1:
//   1. Have respective reading of file in "initState()", 
//      this will make sure the DATA is read from file and
//      WIDGETs are built after it.
//   2. Use ASYNC can help reading of data file and other app init to execute
//      parallely. Thus fast booting or launch of app
//   
// Method-2:
//   1. Works if the first screen is not dependent on the FILE data.
//   2. Have a file reading from BUILD function
//   3. Assumption: 
//      i. the first screen does not need, and 
//      ii. the time taken by user to navigates to widget that needs a data, 
//          is sufficient to load the data from file.
//   4. Have a SIGNATURE check at the last field of the DATA
//   5. Before reading erase SIGNATURE/FLAG and set it after read is done.
//   6. This way, we are sure to put right content to the widget 
//   7. If data is still not loaded, have a default data or show processing
//      sign.
