import 'package:gas_sale/data/models/food.dart';
import 'package:get/get.dart';

class CylinderRepository extends GetConnect {
  Future<List<CylinderModel>> fetchCategory() async {
    List<CylinderModel> cylinderModelList = <CylinderModel>[];
    try{
      final response = await get(
        "https://1e81016d-be7b-4676-86af-fe9be9c2fe48.mock.pstmn.io/cylinders",
        headers: {
          'Accept': 'application/json',
        }
      );
      if(response.statusCode == 200){
        List categories = response.body['categories'];
        cylinderModelList = categories.map((category) => CylinderModel.fromJson(category)).toList();
      } else {
        throw Exception("Failed to retrieve data. ${response.statusCode}");
      }
    } catch(e){
      rethrow;
    }

    return cylinderModelList;
  }
}