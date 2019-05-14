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
// TODO
// https://pub.dev/packages/flutter_email_sender