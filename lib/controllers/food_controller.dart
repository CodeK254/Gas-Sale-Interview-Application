import 'package:gas_sale/models/food.dart';
import 'package:gas_sale/providers/food_provider.dart';
import 'package:get/get.dart';

class FoodController extends GetConnect{
  FoodProvider foodProvider = FoodProvider();
  // RxList<FoodCategory> foodCategoryList = <FoodCategory>[].obs;
  Future<List<FoodCategory>> getCategories() async {
    List<FoodCategory> categories = await foodProvider.fetchCategory();
    return categories;
  }
}