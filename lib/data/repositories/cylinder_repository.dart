import 'dart:convert';
import 'dart:developer';

import 'package:gas_sale/data/models/cylinder_model.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CylinderRepository{
  final http.Client httpClient;
  CylinderRepository({required this.httpClient});
  Future<List<CylinderModel>> fetchCategory() async {
    List<CylinderModel> cylinderModelList = <CylinderModel>[];
    try{
      final response = await httpClient.get(
        Uri.parse("https://6735d1185995834c8a94350f.mockapi.io/api/v1/gas_sale/cylinders"),
        // headers: {
        //   'Accept': 'application/json',
        // }
      );
      if(response.statusCode == 200){
        List categories = jsonDecode(response.body);
        cylinderModelList = categories.map((category) => CylinderModel.fromJson(category)).toList();
      } else {
        throw Exception("Failed to retrieve data. ${response.statusCode}");
      }
    } catch(e){
      log(e.toString());
      rethrow;
    }

    return cylinderModelList;
  }
}