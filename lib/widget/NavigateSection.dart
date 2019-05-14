import 'dart:math';
import 'package:flutter/material.dart';

/// An indicator showing the currently selected page of a PageController
class NavigateSection extends AnimatedWidget {
  NavigateSection ({
    this.controller,
    this.itemCount,
    this.onSectionSelected,
    this.color: Colors.blueGrey, // dots color
    //this.usePageControl, // dots color
    //this.onSectionDoubleTap,
  }) : super(listenable: controller);

  /// The usePageControl is true when pages are built
  //final int usePageControl;

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;
  //final SwiperController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onSectionSelected;

  /// Called when a dot is tapped
  ///final ValueChanged<int> onSectionDoubleTap;

  /// Defaults to `Colors.white`.
  final Color color;

  static Color dotColor; /// change color based on page navigation position

  // The base size of the dots
  static const double _kDotSize = 30.0; //8.0

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.4;

  static const double _kColorChange = _kMaxZoom * 0.8; // at

  // The distance between the center of each dot
  static const double _kDotSpacing = 80.0; //25.0

  static String strImgPath = "assets/images/";

  static List<List<String>> strOnOff = [
    // [ Not selected,  Selected ]
    ["home_36.png", "home_36.png"],
    ["edit_grey_36.png", "edit_red_36.png"],
    ["assist_grey_36.png", "assist_red_36.png"],
    ["question_grey_36.png", "question_red_36.png"],
    ["report_grey_36.png", "report_red_36.png"],
  ];

  Widget _buildDot(int index) {
    print("_buildDot Section  build: $index, ");
    //if (index == 0) {
    //  return new Container();
    //}

    // For animation of dot, i.e. size of dot based on the slide position
    // double selectedness = Curves.easeOut.transform(
    //   max(
    //     0.0,
    //     1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
    //   ),
    // );

    dotColor = color;
    // int    bSelected = 0;
    // double zoom      = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    //
    // if (zoom > _kColorChange) {
    //   dotColor = Color.fromARGB(0xA0, 0xFF, 0x50, 0x50);//Colors.red;
    //   bSelected = 0;
    // }

    //String strImage = strImgPath + strOnOff[index][bSelected];
    //String strImage = strImgPath + strOnOff[index][0];
    String strImage = index.toString();

    return new Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        border: Border.all( color: Color(0xFF000000), width: 1.0, ),
      ),
      //height: _kDotSpacing,
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: dotColor, //color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize, // * zoom,
            height: _kDotSize, // * zoom,
            child: new InkWell(
              //onTap: () => onPageSelected(index),
              onTap: () {
                print("onTap index : $index, ");
                onSectionSelected(index);
              },
              child: Container(
                  padding: EdgeInsets.all(5.5),
                  //child: Image.asset(strImage)),
                  child: Text(strImage)
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

