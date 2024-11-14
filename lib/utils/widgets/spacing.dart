// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class CustomSpacing extends StatelessWidget {
  double? height;
  double? width;
  CustomSpacing({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * (height ?? 0),
      width: MediaQuery.sizeOf(context).height * (width ?? 0),
    );
  }
}