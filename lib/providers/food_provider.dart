import 'package:gas_sale/models/food.dart';
import 'package:get/get.dart';

class FoodProvider extends GetConnect {
  Future<List<FoodCategory>> fetchCategory() async {
    List<FoodCategory> foodCategoryList = <FoodCategory>[];
    try{
      final response = await get(
        "https://www.themealdb.com/api/json/v1/1/categories.php",
        headers: {
          'Accept': 'application/json',
        }
      );
      if(response.statusCode == 200){
        List categories = response.body['categories'];
        foodCategoryList = categories.map((category) => FoodCategory.fromJson(category)).toList();
      }
    } catch(e){
      rethrow;
    }

    return foodCategoryList;
  }
}