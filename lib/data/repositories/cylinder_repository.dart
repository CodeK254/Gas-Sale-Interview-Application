import 'dart:developer';

import 'package:gas_sale/data/models/food.dart';
import 'package:get/get.dart';

class CylinderRepository extends GetConnect {
  Future<List<CylinderModel>> fetchCategory() async {
    List<CylinderModel> cylinderModelList = <CylinderModel>[];
    try{
      final response = await get(
        "https://6735d1185995834c8a94350f.mockapi.io/api/v1/gas_sale/cylinders",
        headers: {
          'Accept': 'application/json',
        }
      );
      log(response.body.toString());
      if(response.statusCode == 200){
        List categories = response.body['categories'];
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