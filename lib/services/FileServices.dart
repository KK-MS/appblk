import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:csv/csv.dart';
// let there be no dependency about the state.
//import 'package:google_maps_flutter_example/redux/AppState.dart';
// we have json data, according to the model, and we read just that model
import 'package:mxsa1905/bloc/survey_bloc.dart';

// Async call to read JSON file
Future<String> _loadAppDataAsset() async {
  return await rootBundle.loadString('assets/json/QA_EN.json');
}

Future<String> _loadAppCsvDataAsset() async {
  print("Before csv loadstring....");
  return await rootBundle.loadString('assets/csv/QA_EN.csv');
}

// Parse the JSON file and store as App store object
//Future<SurveyData> fileServiceLoadAppData() async {
//  String jsonPage   = await _loadAppDataAsset();
//  final parsedJson  = json.decode(jsonPage);
//  SurveyData objAppStore = new SurveyData.fromJson(parsedJson);
//  return objAppStore;
//}


Future<SurveyData> fileServiceLoadAppCsvData() async {

  print("Before csv load....");
  String csvPage = await _loadAppCsvDataAsset();

  //print("aftter csv loadstring...$csvPage.");

  List<List<dynamic>> parsedListCSV = const CsvToListConverter().convert(csvPage);
  String csvParse = parsedListCSV.toString();
  int csvLen = parsedListCSV.length;
  print("CSV Len:$csvLen");
  //print("CSV Data:$csvParse");

  SurveyData objAppStore = new SurveyData.fromCSV(parsedListCSV);
  return objAppStore;
}

// SYNC file read
String syncLoadAppCsvDataAsset() {
  return rootBundle.loadString('assets/csv/QA_EN.csv').toString();
}
SurveyData syncFileServiceLoadAppCsvData() {
  print(" In syncFileServiceLoadAppCsvData");

  String csvPage = syncLoadAppCsvDataAsset();
  List<List<dynamic>> parsedListCSV = const CsvToListConverter().convert(csvPage);
  String csvParse = parsedListCSV.toString();
  int csvLen = parsedListCSV.length;

  print("sssssssssssss CSV Len:$csvLen");
  print("sssssssssssss CSV Data:$csvParse");

  SurveyData objAppStore = new SurveyData.fromCSV(parsedListCSV);

  print(objAppStore);

  return objAppStore;
}

// See JSON format access:
// https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
// JSON File
// TESTING CODE:
/*
Snippet #2 : load Json Asset (optional)
Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/student.json');
}

Snippet #3 : load the response
Future loadStudent() async {
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  Student student = new Student.fromJson(jsonResponse);
  print(student.studentScores);
}
 */
