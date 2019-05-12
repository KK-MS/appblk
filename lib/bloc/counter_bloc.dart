import 'dart:async';
import 'package:flutter/material.dart';

// BLoC includes
import 'package:bloc/bloc.dart';

// App event imports
import 'package:mxsa1905/event/counter_event.dart';

/// Extends Bloc
///    Takes a [Stream] of [Event]s as input
///    and transforms them into a [Stream] of [State]s as output.

/// CounterBloc
/// Counter business logic.
/// Take the Counter current value as a 'Events' input [sink],
/// provides incremented int value as a 'State' output [stream]
/// currentState : Returns the current [State] of the [Bloc].
class CounterBloc extends Bloc<CounterEvent, int> {
  @override

  /// Returns the [State] before any [Event]s have been `dispatched`.
  int get initialState => 0;

  /// Stream<State> mapEventToState(Event event);
  /// Must be implemented when a class extends [Bloc].
  /// Takes the incoming `event` as the argument.
  /// `mapEventToState` is called whenever an [Event] is `dispatched` by the presentation layer.
  /// `mapEventToState` must convert that [Event] into a new [State]
  /// and return the new [State] in the form of a [Stream] which is consumed by the presentation layer.
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield currentState - 1;
        break;
      case CounterEvent.increment:
        yield currentState + 1;
        break;
    }
  }
}


