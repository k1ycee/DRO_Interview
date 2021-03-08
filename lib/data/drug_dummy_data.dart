import 'dart:convert';
import 'dart:io';

import 'package:dro/data/failure.dart';
import 'package:dro/model/drug_data.dart';
import 'package:flutter/services.dart';



abstract class DummyDrugDataABS{
  Future<String> fetchJson();
  Future<List<Drugs>> fetchDrugData();
  Future<List<Drugs>> searchDrugData(String drugname);
}

class DummyDrugData implements DummyDrugDataABS{
  Future<String> fetchJson() async {
    return await rootBundle.loadString("json/drug_dummy_data.json");
  }

  Future<List<Drugs>> fetchDrugData() async {
    try {
      String drugData = await fetchJson();
      final drugJsonData = jsonDecode(drugData);
      final Iterable drugListData = drugJsonData["drugs"];
      // Fake Delay to emulate a network call
      Future.delayed(Duration(milliseconds: 500));
      return drugListData.map((drug) => Drugs.fromJson(drug)).toList();
    } on SocketException {
      throw SocketException("No Internet connection");
    } on HttpException {
      throw Failure("Couldn't find the post");
    } on FormatException {
      throw Failure("Bad response format");
    }
  }

  Future<List<Drugs>> searchDrugData(String drugname) async {
    try {
      String drugData = await fetchJson();
      final drugJsonData = jsonDecode(drugData);
      List<Drugs> drugListData = drugJsonData["drugs"];
      // Fake Delay to emulate a network call
      Future.delayed(Duration(milliseconds: 500));
      return drugListData.where((drug) => drug.drugName == drugname).toList();
    } on SocketException {
      throw SocketException("No Internet connection");
    } on HttpException {
      throw Failure("Couldn't find the post");
    } on FormatException {
      throw Failure("Bad response format");
    }
  }
}
