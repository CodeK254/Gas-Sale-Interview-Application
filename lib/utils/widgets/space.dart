import 'package:flutter/material.dart';

double verticalSpace(BuildContext context, double height){
  return MediaQuery.sizeOf(context).height * height;
}

double horizontalSpace(BuildContext context, double width){
  return MediaQuery.sizeOf(context).width * width;
}