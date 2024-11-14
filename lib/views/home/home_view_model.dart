import 'package:gas_sale/data/models/food.dart';
import 'package:gas_sale/data/repositories/cylinder_repository.dart';
import 'package:get/get.dart';

class FoodController extends GetConnect{
  CylinderRepository cylinderRepository = CylinderRepository();
  // RxList<CylinderModel> CylinderModelList = <CylinderModel>[].obs;
  Future<List<CylinderModel>> getCategories() async {
    List<CylinderModel> categories = await cylinderRepository.fetchCategory();
    return categories;
  }
}