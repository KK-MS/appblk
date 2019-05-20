import 'dart:async';
import 'package:flutter/material.dart';

// BLoC includes
import 'package:bloc/bloc.dart';

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

enum SurveyEvent { toggle }

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
