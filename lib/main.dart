import 'package:flutter/material.dart';
import 'package:gas_sale/views/home/cylinder_view_model.dart';
import 'package:gas_sale/views/home/home_screen.dart';
import 'package:gas_sale/views/loading/loading_screen.dart';
import 'package:gas_sale/views/loading/loading_vew_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.ubuntuTextTheme(),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            backgroundColor: Colors.pink,
            padding: EdgeInsets.all(0),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
        )
      ),
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