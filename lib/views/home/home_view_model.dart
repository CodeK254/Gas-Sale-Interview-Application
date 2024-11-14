import 'package:gas_sale/data/models/cylinder_model.dart';
import 'package:gas_sale/data/repositories/cylinder_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FoodController extends GetConnect{
  CylinderRepository cylinderRepository = CylinderRepository(httpClient: http.Client());
  // RxList<CylinderModel> CylinderModelList = <CylinderModel>[].obs;
  Future<List<CylinderModel>> getCategories() async {
    List<CylinderModel> categories = await cylinderRepository.fetchCategory();
    return categories;
  }
}