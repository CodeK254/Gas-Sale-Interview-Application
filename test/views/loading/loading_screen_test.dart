import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart'; 
import 'package:gas_sale/views/loading/loading_screen.dart';
import 'package:get/get.dart';


// Sample Widget Tests
void main() {
	group(
		"Loading Screen Widget Test", 
		() {
			testWidgets(
				'Test loading screen to ensure it is build successfully',
				(tester) async {
          await tester.pumpWidget(GetMaterialApp(home: LoadingScreen()));

          // final ctr = find.widgetWithImage(Center, AssetImage('assets/cylinder.png'));
          final ctr = find.image(AssetImage('assets/cylinder.png'));
          expect(ctr, findsOneWidget);
				},
			);
		},
	);
}