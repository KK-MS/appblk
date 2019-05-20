import 'dart:async';
import 'package:flutter/material.dart';

// BLoC includes
import 'package:bloc/bloc.dart';
import 'package:mxsa1905/services/FileServices.dart';

SurveyData g_SurveyData;

//enum SurveyEvent { toggle }

class SurveyEvent {
  int iIdxVar1;
  int iIdxVar2;
  int iAnsRow;
  int iAnsCol;
}

//SurveyData gSurveyData = fileServiceLoadAppCsvData();
class SurveyBloc extends Bloc<SurveyEvent, SurveyData> {

  @override
  //SurveyData get initialState => syncFileServiceLoadAppCsvData();
  SurveyData get initialState => g_SurveyData;

  @override
  Stream<SurveyData> mapEventToState(SurveyEvent event) async* {
    //yield currentState;
    //return SurveyData.fromEvent(currentState, event);
    yield SurveyData.fromEvent(currentState, event);

  }
}

class SurveyData {
   SurveyModelFlat objSurveyData;
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
     print("In survey data ");

     String _strPrjID = parsedCSV[1][0].toString();
     print("In survey data flat projID: $_strPrjID");

     return SurveyData(
       objSurveyData: SurveyModelFlat.fromCSV(parsedCSV),
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

class SurveyModelFlat {
  String strPrjID;
  String strPrjName;
  List<Element> lstObjVar1;
  List<Element> lstObjVar2;
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
    List<Element> _lstObjVar1;
    List<Element> _lstObjVar2;
    List<SurveyQAData> _lstSurveyQAData;

    print("In survey model flat");
    _strPrjID = parsedCSV[0][0].toString();
    _strPrjName = parsedCSV[1][0].toString();
    print("In survey model flat projID: $_strPrjID");

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
