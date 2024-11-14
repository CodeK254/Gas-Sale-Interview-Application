import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gas_sale/data/models/cylinder_model.dart';
import 'package:gas_sale/data/repositories/cylinder_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CylinderViewModel extends GetConnect{
  CylinderRepository cylinderRepository = CylinderRepository(httpClient: http.Client());
  final RxSet<CylinderModel> _cartItems = <CylinderModel>{}.obs;
  Set get cartItems => _cartItems;
  final RxInt _selected = 0.obs;
  int get selected => _selected.value;
  bool exists(CylinderModel item) => _cartItems.contains(item);

  void toggleSelected(int index){
    _selected.value = index;
  }

  void addToCart(CylinderModel item){
    _cartItems.add(item);
    log(_cartItems.toString());
  }

  void removeFromCart(CylinderModel item){
    _cartItems.remove(item);
  }

  void checkout(CylinderModel item) async {
    _cartItems.remove(item);
    await Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Thanks for making this purchase. Feel free to browse our new catalog.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: (){

                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red.shade300,
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
                TextButton(
                  onPressed: (){

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