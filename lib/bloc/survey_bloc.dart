import 'dart:async';
import 'package:flutter/material.dart';

// BLoC includes
import 'package:bloc/bloc.dart';
import 'package:mxsa1905/services/FileServices.dart';

//enum SurveyEvent { toggle }

class SurveyEvent {
  int iIdxVar1;
  int iIdxVar2;
  int iAnsRow;
  int iAnsCol;
}

//SurveyData gSurveyData = fileServiceLoadAppCsvData();
class SurveyBloc extends Bloc<SurveyEvent, SurveyData> {
  SurveyData initStateData;

  SurveyBloc({this.initStateData});

  @override
  //SurveyData get initialState => syncFileServiceLoadAppCsvData();
  //SurveyData get initialState => g_SurveyData;
  SurveyData get initialState => initStateData;

  @override
  Stream<SurveyData> mapEventToState(SurveyEvent event) async* {
    //yield currentState;
    //return SurveyData.fromEvent(currentState, event);
    yield SurveyData.fromEvent(currentState, event);

  }
}

class SurveyData {
   //SurveyModelFlat objSurveyData;
   SurveyModelCSV objSurveyData;
   int iIdxVar1;
   int iIdxVar2;
   int iAnsRow;
   int iAnsCol;

   SurveyData({this.objSurveyData,
     this.iIdxVar1,
     this.iIdxVar2,
     this.iAnsRow,
     this.iAnsCol,
   });

   factory SurveyData.fromCSV(List<List<dynamic>> parsedCSV) {

     return SurveyData(
       //objSurveyData: SurveyModelFlat.fromCSV(parsedCSV),
       objSurveyData: SurveyModelCSV.fromCSV(parsedCSV),
       iIdxVar1: 0,
       iIdxVar2: 0,
       iAnsRow: 0,
       iAnsCol: 0,
     );
   }

   factory SurveyData.fromEvent(
       SurveyData currData,
       SurveyEvent currEvent
       ) {

     return SurveyData(
       objSurveyData: currData.objSurveyData,
       iIdxVar1: currEvent.iIdxVar1,
       iIdxVar2: currEvent.iIdxVar2,
       iAnsRow : currEvent.iAnsRow,
       iAnsCol : currEvent.iAnsCol,
     );
   }
}
// @ MODEL @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
class SurveyModelCSV {
  List<List> surveyCSV;

  SurveyModelCSV({this.surveyCSV});

  factory SurveyModelCSV.fromCSV(List<List> parsedCSV) {
    return SurveyModelCSV(
      surveyCSV: parsedCSV,
    );
  }

  display() {
    int i, j;
    int rows, cols;
    rows = surveyCSV.length;

    for(i=0; i< rows; i++) {
      cols = surveyCSV[i].length;

      for (j=0; j< cols; j++) {
        print(surveyCSV[i][j].toString());
      }
    }
  }
}

class SurveyModelFlat {
  String strPrjID;
  String strPrjName;
  List<String> lstObjVar1;
  List<String> lstObjVar2;
  List<SurveyQAData> lstSurveyQAData;

  SurveyModelFlat({
    this.strPrjID,
    this.strPrjName,
    this.lstObjVar1,
    this.lstObjVar2,
    this.lstSurveyQAData,
  });

  factory SurveyModelFlat.fromCSV(List<List> parsedCSV) {
    String _strPrjID;
    String        _strPrjName;
    List<String> _lstObjVar1;
    List<String> _lstObjVar2;
    List<SurveyQAData> _lstSurveyQAData;

    _strPrjID = parsedCSV[0][0].toString();
    _strPrjName = parsedCSV[1][0].toString();

    int i, j;
    int iVar1Len, iVar2Len;
    int len, iResLen;
    int idx, iQAIdx;

    idx = 2; len = parsedCSV[idx].length - 1; _lstObjVar1 = new List(len);
    for(i = 0; i < len; i++) { _lstObjVar1[i] = parsedCSV[idx][i].toString(); }
    iVar1Len = _lstObjVar1.length;

    idx = 3; len = parsedCSV[idx].length - 1; _lstObjVar2 = new List(len);
    for(i = 0; i < len; i++) { _lstObjVar2[i] = parsedCSV[idx][i].toString(); }

    idx = 4;

    //int iRes = (_lstObjVar1.length - 1) * (_lstObjVar2.length - 1);

    int iRes = (_lstObjVar1.length - 1);

    int iQACount = parsedCSV.length - 4;

    print("Ans Response cnt iRes:$iRes");
    print("TOTAL QA: $iQACount");
    _lstSurveyQAData = new List(iQACount);

    for (iQAIdx=0; iQAIdx < iQACount; iQAIdx++ , idx++) {
      print("Loop----------------------");
      print("iQAidx: $iQAIdx, parse");
      print(parsedCSV[idx]);
//print(parsedCSV[idx][0].toString());
      _lstSurveyQAData[iQAIdx].setQType = parsedCSV[idx][0].toString();

     // _lstSurveyQAData[iQAIdx].strQType = parsedCSV[idx][0].toString();
      //_lstSurveyQAData[iQAIdx].strQ = parsedCSV[idx][1].toString();
      //_lstSurveyQAData[iQAIdx].strAnsType = parsedCSV[idx][2].toString();

      //i = 3;

      //List<String> _lstAns = new List(iRes);
      //for (j = 0; j < iRes; j++, i++) {
      //  _lstAns[j] = parsedCSV[idx][i].toString();
      //}
      //_lstSurveyQAData[iQAIdx].lstAns = _lstAns;

      //List<String> _lstRem = new List(iRes);
      //for (j = 0; j < iRes; j++, i++) {
      //  _lstRem[j] = parsedCSV[idx][i].toString();
      //}
      //_lstSurveyQAData[iQAIdx].lstRemarks = _lstRem;

      //print(_lstSurveyQAData[iQAIdx]);
      print("Loop End----------------------");

    }

    //print(_lstSurveyQAData[1]);

    return SurveyModelFlat(
      strPrjID:   _strPrjID,
      strPrjName: _strPrjName  ,
      lstObjVar1: _lstObjVar1 ,
      lstObjVar2:_lstObjVar2 ,
      lstSurveyQAData: _lstSurveyQAData,
    );
  }
}
// 333333333333333333333333333333333333333333333
class SurveyModel {

  SurveyMetadata surveyMetadata;
  List<SurveyQAData> lstSurveyQAData;

  SurveyModel({this.surveyMetadata, this.lstSurveyQAData});

  factory SurveyModel.fromCSV(List<List> parsedCSV) {

//    List<SurveyQAData> _lstSurveyQAData = list.map((i) =>
//        Response.fromJson(i)).toList();

    return SurveyModel(
      surveyMetadata: SurveyMetadata.fromCSV(parsedCSV),
    );
  }
}
//class CsvRow {
//
//  CsvRow ({});
//
//  factory CsvRow.ListOfStrings(List<List> parsedCSV) {
//    return CsvRow();
//  }
//}

class SurveyMetadata {
  String strPrjID;
  String strPrjName;
  List<String> lstVehIDs; //int intNumVeh;
  List<String> lstDrvIDs; //int intNumDrv;

  SurveyMetadata({this.strPrjID, this.strPrjName, this.lstVehIDs, this.lstDrvIDs});

  factory SurveyMetadata.fromCSV(List<List> parsedCSV) {

    //List<String> lstString = new List(); // TODO: make it fixed with new List(length)
    //// Skip Column = 0, values are from column 1, 2, ...
    //for (int i= 1; i < parsedCSV[2].length; i++ ) {
    //  lstString.add(parsedCSV[2][i]);
    //}

    return SurveyMetadata (
      strPrjID: parsedCSV[0][1].toString(),
      strPrjName: parsedCSV[1][1].toString(),
      lstDrvIDs: parsedCSV[2],
    );
  }
}

class SurveyQAData {
  String strQType;
  String strQ;
  String strAnsType;
  List<String> lstAns;
  List<String> lstRemarks;

  SurveyQAData({this.strQType,
  this.strQ, this.strAnsType, this.lstAns, this.lstRemarks});

  set setQType(String qType) => strQType = qType;

}


//class SurveyBloc extends Bloc<SurveyEvent, SurveyModel> {
//  @override
//  SurveyModel get initialState => SurveyModel.init();
//
//  @override
//  Stream<SurveyData> mapEventToState(SurveyEvent event) async* {
//    switch (event) {
//      case SurveyEvent.toggle:
//        yield currentState == SurveyData.dark()
//            ? SurveyData.light()
//            : SurveyData.dark();
//        break;
//    }
//  }
//}
