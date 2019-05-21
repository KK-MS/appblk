//import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// BLoC
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigate_content.dart';

import 'package:mxsa1905/bloc/survey_bloc.dart';

class QACard extends StatelessWidget{
  final cardIndex;

  QACard({this.cardIndex});

  @override
  Widget build(BuildContext context) {

    final SurveyBloc _surveyBloc = BlocProvider.of<SurveyBloc>(context);

    return BlocBuilder(
        bloc: _surveyBloc,
        builder: (_, SurveyData surveyData) {
          print("QACard:$cardIndex");
          return Column(
            children: <Widget>[
              Container(
                height: 5,
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 3),
                decoration: BoxDecoration(
                  color: Color(0xA0FF8585),
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0)),
                ),
              ),
              Row(
                children: <Widget>[
                  //Text("QA | $cardIndex | "),
                  //Text("Bar |"),
                  //Text(surveyData.getMainQ(cardIndex)),
                  //Text(" | "),
                  //Text(surveyData.getSubQCount(cardIndex).toString()),
                  //Text(" | "),
                  //Text(surveyData.getSubQ(cardIndex, 2)),
                  //Text(" | "),
                  //Text(surveyData.getAns(cardIndex, 2, 1, 1)),
                  //Text(" | "),

                  addQAGroup(cardIndex, surveyData, _surveyBloc),
                  //addToolBar(),
                  //addStatusInfo(),
                ],
              )
            ],

          );

        }
    );

  }

  static Widget addQATitle(String strQATitle) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
          children: <Widget>[
            Container(
              width: 250,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(1, 5, 10, 1),
              child: //Row(children: <Widget>[
                  Text(
                strQATitle,
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  //color: Colors.red,
                ),
              ),
              //TODO add image/icon, click for info, Icon(Icons.volume_off),
              //]),
            ),
            Container(
              width: 75,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(1, 5, 1, 1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 10,
                  ),
                  Text(
                    "1",
                    style: new TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      //color: Colors.red,
                    ),
                  ),
                  new Icon(
                    Icons.directions_car,
                    color: Colors.blueGrey,
                    size: 30.0,
                  ),
                ],
              ),
            ),
            Container(
              width: 75,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(1, 5, 1, 1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 10,
                  ),
                  Text(
                    "2",
                    style: new TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      //color: Colors.red,
                    ),
                  ),
                  new Icon(
                    Icons.directions_car,
                    color: Colors.blueGrey,
                    size: 30.0,
                  ),
                ],
              ),
            ),
            Container(
              width: 75,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(1, 5, 1, 1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 10,
                  ),
                  Text(
                    "3",
                    style: new TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      //color: Colors.red,
                    ),
                  ),
                  new Icon(
                    Icons.directions_car,
                    color: Colors.blueGrey,
                    size: 30.0,
                  ),
                ],
              ),
            ),
            Container(
              width: 75,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(1, 5, 1, 1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 10,
                  ),
                  Text(
                    "4",
                    style: new TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      //color: Colors.red,
                    ),
                  ),
                  new Icon(
                    Icons.directions_car,
                    color: Colors.blueGrey,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

Widget addQAGroup(int cardIndex, SurveyData surveyData, SurveyBloc _surveyBloc) {

  var commentWidgets = List<Widget>();
  int iCount  = surveyData.getSubQCount(cardIndex);
  int i;

  commentWidgets.add(
      addQATitle("Parametersxx")
  );
  commentWidgets.add(
      addQARow(
          0,
          surveyData.getMainQ(cardIndex),
          _surveyBloc)
  );

  for (i =0; i<iCount; i++ ) {
    //commentWidgets.add(Text(comment.text)); // TODO: Whatever layout you need for each widget.
    commentWidgets.add(addQARow(1 + i, surveyData.getSubQ(cardIndex, i), _surveyBloc));
  }

  return Column( children: commentWidgets, );

    // int iQASetNum
   // return Column(
   //   children: <Widget>[
   //     addQATitle("Parameters"),

   //     //Text(surveyData.getMainQ(cardIndex)),
   //     //Text(surveyData.getSubQCount(cardIndex).toString()),
   //     //Text(surveyData.getSubQ(cardIndex, 0)),
   //     //Text(surveyData.getSubQ(cardIndex, 1)),
   //     //Text(surveyData.getSubQ(cardIndex, 2)),
   //     //Text(surveyData.getSubQ(cardIndex, 3)),

   //     addQARow(0, surveyData.getMainQ(cardIndex)),
   //     addQARow(1, surveyData.getSubQ(cardIndex, 0)),
   //     addQARow(2, surveyData.getSubQ(cardIndex, 1)),
   //     addQARow(3, surveyData.getSubQ(cardIndex, 2)),
   //     addQARow(4, surveyData.getSubQ(cardIndex, 3)),

   //     // TODO STORE Get from store, use class variable int iQASetNum for QA Set
   //     //addQARow(0, oQASet.cPrimeQA.sQry),
   //     //addQARow(1, oQASet.lSubQAs[0].sQry),
   //     //addQARow(2, oQASet.lSubQAs[1].sQry),
   //     //addQARow(3, oQASet.lSubQAs[2].sQry),
   //     //addQARow(4, oQASet.lSubQAs[3].sQry),

   //     // addQARow(0, "Lane keeping quality"),
   //     // addQARow(1, "Driving lane"),
   //     // addQARow(2, "Lane accuracy"),
   //     // addQARow(3, "Side position"),
   //     // addQARow(4, "drift oscillate"),
   //   ],
   // );
  }


  Widget addQARow(int iQNum, String strQA, SurveyBloc _surveyBloc) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
          children: <Widget>[
            Container(
              width: 250,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(1, 5, 10, 1),
              child: Text(
                strQA,
                style: new TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              //TODO add image/icon, click for info, Icon(Icons.volume_off),
            ),
            addAnsBox(iQNum, 0, _surveyBloc),
            addAnsBox(iQNum, 1, _surveyBloc),
            addAnsBox(iQNum, 2, _surveyBloc),
            addAnsBox(iQNum, 3, _surveyBloc),
          ],
        ));
  }

  List<List<double>> dAns = [
    [7.5, 7.5, 7.5, 7.5],
    [7.5, 7.5, 7.5, 7.5],
    [7.5, 7.5, 7.5, 7.5],
    [7.5, 7.5, 7.5, 7.5],
    [7.5, 7.5, 7.5, 7.5],
  ];

  List<int> dColorAns = [
    0xFFFF0000, // 0.0
    0xFFFF0000, // 0.5
    0xFFFF0000, // 1.0
    0xFFFF0000, // 1.5
    0xFFFF0000, // 2.0
    0xFFFF0000, // 2.5
    0xFFFF0000, // 3.0
    0xFFFF0000, // 3.5
    0xFFFF2020, // 4.0
    0xFFFF5050, // 4.5
    0xFFFF8080, // 5.0
    0xFFFFB0B0, // 5.5
    0xFFFFD0D0, // 6.0
    0xFFFFE0E0, // 6.5
    0xFFF0FFF0, // 7.0
    0xFFE0FFE0, // 7.5
    0xFFD0FFD0, // 8.0
    0xFFA0FFA0, // 8.5
    0xFF70FF70, // 9.0
    0xFF40FF40, // 9.5
    0xFF00FF00, //10.0
  ];

  int iSelectedQ;
  int iSelectedA;

  Widget addAnsBox(int iQNum, int iANum, SurveyBloc _surveyBloc) {
    // TODO STORE Get from store
    // TODO Remove intermediate variable

    int _iAnsRow =4 + iQNum;
    int _iAnsCol =3 + iANum;

    double iAns = double.parse(_surveyBloc.currentState.objSurveyData.getVal(_iAnsRow, _iAnsCol));

    //int iUserAnsStartIndex = iSelectedUserNum  * iNumOfTestVehicles;

   // if (oQASet.cPrimeQA.lResponses.length < (iUserAnsStartIndex +  iNumOfTestVehicles)) {
   //   print("ERROR in ANSWER INDEX. StartIndex: $iUserAnsStartIndex, NumOfVehichle: $iNumOfTestVehicles");
   //   return Container();
   // }

   // if (iQNum == 0) { // Q=0 is Q1
   //   //dAns[iQNum][iANum] = double.parse(oQASet.cPrimeQA.lResponses[iANum].sAns);
   //   dAns[iQNum][iANum] = double.parse(oQASet.cPrimeQA.lResponses[iUserAnsStartIndex + iANum].sAns);
   //   dVal =  dAns[iQNum] [iANum];
   //   print("Add Ans Q:$iQNum, Si:$iUserAnsStartIndex, Veh:$iANum, AnsValue:$dVal");
   // } else {
   //   dAns[iQNum][iANum] = double.parse(oQASet.lSubQAs[iQNum-1].lResponses[iUserAnsStartIndex + iANum].sAns);
   //   dVal =  dAns[iQNum-1] [iANum];
   //   print("Sub Q:$iQNum-1, Si:$iUserAnsStartIndex, Veh:$iANum, AnsValue:$dVal");
   // }

   // String strValue = dAns[iQNum][iANum].toString();

   // int iColorIndex = (dAns[iQNum][iANum] / 0.5).round();

   Color btAnsBox = Colors.blueGrey;
   Color btAnsBoxShadowColor = Colors.transparent;

   // if ((iSelectedQ == iQNum) && (iSelectedA == iANum)) {
   //   //btAnsBox = Colors.redAccent;
   //   btAnsBoxShadowColor = Colors.yellowAccent;
   // }

    return Container(
      width: 70,
      margin: const EdgeInsets.fromLTRB(1, 1, 1, 1),
      child: FlatButton(
        onPressed: () {

          print("Bt Pressed QG: Q:$iQNum A:$iANum");
          SurveyEvent event = new SurveyEvent();

          event.iIdxVar1 = iANum;
          event.iIdxVar2 = 0;
          event.iAnsRow = iQNum;
          event.iAnsCol = iANum;

          _surveyBloc.dispatch(event);
          //print("Pressed QSet $iQASetNum, Q1/Q2: $iQNum, V:$iANum");
          //setState(() {
          //  iSelectedQ = iQNum;
          //  iSelectedA = iANum;

          //  if (btnToolInc == 1) {
          //    dAns[iQNum][iANum] += 0.5;
          //  } else {
          //    dAns[iQNum][iANum] -= 0.5;
          //  }
          //  if (dAns[iQNum][iANum] > 10.0) {
          //    dAns[iQNum][iANum] = 10.0;
          //  } else if (dAns[iQNum][iANum] < 0.0) {
          //    dAns[iQNum][iANum] = 0.0;
          //  }

          //  String strVal = dAns[iQNum][iANum].toString();
          //  if (iQNum == 0) { // Q=0 is Q1
          //    oQASet.cPrimeQA.lResponses[iUserAnsStartIndex + iANum].sAns = strVal;
          //    print("Save: Add Ans Q:$iQNum, Si:$iUserAnsStartIndex, Veh:$iANum, strValue:$strVal");
          //  } else {
          //    oQASet.lSubQAs[iQNum-1].lResponses[iUserAnsStartIndex + iANum].sAns = strVal;
          //    print("Save: Sub Q:$iQNum-1, Si:$iUserAnsStartIndex, Veh:$iANum, strValue:$dVal");
          //  }

          //});
        },
        //child: Text("$iQNum, $iANum"),//Text(strValue)
        child: Text("$iQNum, $iANum, $iAns"),//Text(strValue)
      ),

      decoration: new BoxDecoration(
        //color: Color(dColorAns[iColorIndex]),// Color.fromARGB(iA, iR, iG, iB), //Colors.white,
        color: Color(dColorAns[iANum]),// Color.fromARGB(iA, iR, iG, iB), //Colors.white,
        border: new Border.all(color: btAnsBox),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: [
          new BoxShadow(
            color: btAnsBoxShadowColor,
            blurRadius: 10.0,
          ),
        ]
      ),
    );
  }
}
