import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gas_sale/data/models/cylinder_model.dart';
import 'package:gas_sale/data/repositories/cylinder_repository.dart';
import 'package:gas_sale/utils/widgets/spacing.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CylinderViewModel extends GetConnect{
  CylinderRepository cylinderRepository = CylinderRepository(httpClient: http.Client());
  final RxList<CylinderModel> _cartItems = <CylinderModel>[].obs;
  List get cartItems => _cartItems;
  final RxInt _selected = 0.obs;
  int get selected => _selected.value;
  bool exists(CylinderModel item) => _cartItems.where((element) => element.name == item.name).isNotEmpty;

  void toggleSelected(int index){
    log("Invocked");
    _selected.value = index;
  }

  void addToCart(CylinderModel item){
    _cartItems.addIf(!exists(item), item);
    log(item.toMapString);
  }

  void removeFromCart(CylinderModel item){
    _cartItems.remove(item);
  }

  void checkout(CylinderModel item) async {
    _cartItems.remove(item);
    await Get.dialog(
      AlertDialog(
        title: Text(
          "Success!!!",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomSpacing(height: .012),
            Image(
              image: AssetImage('assets/badge.png'),
              height: 150,
              width: 150,
              color: Colors.green,
            ).animate(
              effects: [
                SlideEffect(
                  begin: Offset(0, -.5),
                  end: Offset(0, 0),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.bounceOut,
                ),
              ],
            ),
            CustomSpacing(height: .012),
            Text(
              "Thanks for making this purchase. Feel free to browse our new catalog.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            CustomSpacing(height: .012),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){
                    if(_cartItems.isEmpty){
                      Get.back();
                      _selected.value = 0;
                    } else {
                      Get.back();
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Okay',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  )
                )
              ],
            )
          ],
        ),
      ),
      barrierDismissible: false
    );
  }
  // RxList<CylinderModel> CylinderModelList = <CylinderModel>[].obs;
  Future<List<CylinderModel>> getCategories() async {
    List<CylinderModel> categories = await cylinderRepository.fetchCategory();
    return categories;
  }
}