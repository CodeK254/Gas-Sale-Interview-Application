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
    return Obx(
      () => Scaffold(
        body: cylinderViewModel.selected == 0 ? 
          CylinderSection(cylinderViewModel: cylinderViewModel)
        : CartSection(cylinderViewModel: cylinderViewModel),
        bottomNavigationBar: BottomNavigationBarTheme(
          data: BottomNavigationBarThemeData(
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: IconThemeData(
              size: 25,
            ),
            selectedLabelStyle: TextStyle(
              fontSize: 16,
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: cylinderViewModel.selected,
            onTap: (index){
              cylinderViewModel.toggleSelected(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                    ),
                    Visibility(
                      visible: cylinderViewModel.cartItems.isNotEmpty,
                      child: Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 6.5,
                          backgroundColor: Colors.grey.shade100,
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.orange.shade700,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                label: "Cart",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
