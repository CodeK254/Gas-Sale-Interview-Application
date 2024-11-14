import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gas_sale/utils/widgets/space.dart';
import 'package:gas_sale/views/loading/loading_vew_model.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({super.key});
  final LoadingViewModel loadingViewModel = Get.find<LoadingViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Image(
            image: AssetImage('assets/cylinder.png'),
            width: horizontalSpace(context, .55),
            height: verticalSpace(context, .45),
          ).animate(
            effects: [
              ScaleEffect(
                begin: Offset(1, 1),
                end: Offset(1.5, 1.5),
                duration: Duration(seconds: 3),
                curve: Curves.linear
              ),
            ],
          ),
        ),
      ),
    );
  }
}