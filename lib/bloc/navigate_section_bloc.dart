import 'dart:async';
import 'package:flutter/material.dart';

// BLoC includes
import 'package:bloc/bloc.dart';

// App event imports
import 'package:mxsa1905/event/navigate_section_event.dart';

/// NavigateSectionBloc
/// NavigateSection business logic.
/// currentState : Returns the current [State] of the [Bloc].
class NavigateSectionBloc extends Bloc<NavigateSectionEvent, int> {
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
  Stream<int> mapEventToState(NavigateSectionEvent event) async* {
    // Easy simple meaning
    // yield event.index;
    // TODO change hardcoded number to output events enum.
    switch (event) {
      case NavigateSectionEvent.welcome: yield 0; break;
      case NavigateSectionEvent.config: yield 1; break;
      case NavigateSectionEvent.assist: yield 2; break;
      case NavigateSectionEvent.survey: yield 3; break;
      case NavigateSectionEvent.graph: yield 4; break;
    }
  }
}

