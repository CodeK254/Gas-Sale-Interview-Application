import 'package:flutter_test/flutter_test.dart';
import 'package:gas_sale/views/home/home_screen.dart';
import 'package:get/get.dart';

void main() {
  setUp((){

  });
	group(
		"HomeScreen Test Functions", 
		() {
			testWidgets(
				'Test HomeScreen being rendered',
				(testers) async {
          await testers.pumpWidget(
            GetMaterialApp(
              home: HomeScreen(),
            ),
          );
				},
			);
		},
	);
}