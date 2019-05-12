import 'dart:async';
import 'package:flutter/material.dart';

// Standard imports
// BLoC
import 'package:flutter_bloc/flutter_bloc.dart';

// App imports
// BLoC
import 'package:mxsa1905/bloc/theme_bloc.dart';
import 'package:mxsa1905/bloc/counter_bloc.dart';

// Event
// import 'package:mxsa1905/event/counter_event.dart';

// App widget
//import 'package:mxsa1905/widget/counter_page_widget.dart';
import 'package:mxsa1905/widget/root_widget.dart';

class MxApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MxAppState();
}

class _MxAppState extends State<MxApp> {
  final CounterBloc _counterBloc = CounterBloc();
  final ThemeBloc _themeBloc = ThemeBloc();

  var thme = ThemeData(
    // Define the default Brightness and Colors
    brightness: Brightness.light, // light-> font in black
    primaryColor: Colors.red,// lightBlue[800],
    accentColor: Colors.redAccent,//.cyan[600],

    // Define the default Font Family
    fontFamily: 'Montserrat',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline: TextStyle(
          fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var strTitle = "Default";
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<CounterBloc>(bloc: _counterBloc),
        BlocProvider<ThemeBloc>(bloc: _themeBloc)
      ],
      child: BlocBuilder(
        bloc: _themeBloc,
        builder: (_, ThemeData theme) {
          strTitle = "Default";

          if (theme != ThemeData.dark() ) {
            strTitle = "Theme change to non-dark !!";
            print(strTitle);
            theme = thme;
         }

          theme = thme;
          return MaterialApp(
            title: strTitle,
            home: RootWidget(),
            theme: theme,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    _themeBloc.dispose();
    super.dispose();
  }
}

