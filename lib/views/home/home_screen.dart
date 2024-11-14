import 'package:gas_sale/views/home/cylinder_view_model.dart';
import 'package:flutter/material.dart';
import 'package:gas_sale/views/home/section/cart_section.dart';
import 'package:gas_sale/views/home/section/cylinder_section.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final CylinderViewModel cylinderViewModel = Get.put(CylinderViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cylinderViewModel.selected == 0 ? 
        CylinderSection(cylinderViewModel: cylinderViewModel)
      : CartSection(cylinderViewModel: cylinderViewModel),
      bottomNavigationBar: BottomNavigationBarTheme(
        data: BottomNavigationBarThemeData(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: "Cart",
            ),
          ],
        ),
      ),
    );
  }
}
