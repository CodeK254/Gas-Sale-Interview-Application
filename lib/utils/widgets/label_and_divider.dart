import 'package:flutter/material.dart';
import 'package:gas_sale/utils/widgets/space.dart';
import 'package:gas_sale/utils/widgets/spacing.dart';

class CustomLabelAndDivider extends StatelessWidget {
  final String label;
  final Color? textColor;
  final bool? extendedDivider;
  const CustomLabelAndDivider({
    super.key, required this.label, this.textColor, this.extendedDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSpacing(height: .02),
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.blueGrey.shade800,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: horizontalSpace(context, .15),
              height: 2,
              color: Colors.blue,
            ),
            CustomSpacing(height: .02),
            Container(
              width: !extendedDivider! ? horizontalSpace(context, .22) : horizontalSpace(context, .75),
              height: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}