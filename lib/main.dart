import 'package:flutter/material.dart';
import 'package:gas_sale/utils/constants/theme_data.dart';
import 'package:gas_sale/views/home/cylinder_view_model.dart';
import 'package:gas_sale/views/home/home_screen.dart';
import 'package:gas_sale/views/loading/loading_screen.dart';
import 'package:gas_sale/views/loading/loading_vew_model.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      getPages: [
        GetPage(
          name: '/', 
          page: () => LoadingScreen(),
          binding: BindingsBuilder(
            (){
              Get.lazyPut<LoadingViewModel>(() => LoadingViewModel());
            }
          )
        ),
        GetPage(
          name: '/home', 
          page: () => HomeScreen(),
          binding: BindingsBuilder(
            (){
              Get.lazyPut<CylinderViewModel>(() => CylinderViewModel());
            }
          )
        ),
      ],
    ),
  );
}