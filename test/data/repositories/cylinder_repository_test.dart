import 'package:flutter_test/flutter_test.dart';
// import 'package:gas_sale/data/models/cylinder_model.dart';
// import 'package:gas_sale/data/repositories/cylinder_repository.dart';
import 'package:gas_sale/views/home/cylinder_view_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'cylinder_repository_test.mocks.dart';

// class MockAPICall extends Mock implements http.Client{}

@GenerateMocks([http.Client])

void main() {
  late CylinderViewModel cylinderViewModel;
  // late MockClient mockClient;
  // late CylinderRepository cylinderRepository;
  setUp((){
    cylinderViewModel = Get.put(CylinderViewModel());
    // mockClient = MockClient();
    // cylinderRepository = CylinderRepository(httpClient: mockClient);
  });
	group(
		"Cylinder Repository Test Class", 
		() {
			test(
				'Ensure the selected index is O upon initialization',
				() async {
          int selected = cylinderViewModel.selected;
          expect(selected, 0);
				},
			);

      test(
				'Ensure the selected index is sets to input value upon toggleSelect(index) function invocation',
				() async {
          int index = 5;
          cylinderViewModel.toggleSelected(index);
          int selected = cylinderViewModel.selected;
          expect(selected, index);
				},
			);

      test(
				'Ensure the _cartList is empty upon object declaration',
				() async {
          bool isEmpty = cylinderViewModel.cartItems.isEmpty;
          expect(isEmpty, true);
				},
			);

      test(
				'Ensure the _cartList is empty upon object declaration',
				() async {
          bool isEmpty = cylinderViewModel.cartItems.isEmpty;
          expect(isEmpty, true);
				},
			);

      // group("Testing Mock API via mockito", () {
      //   test("Mock HTTP function Invocation", () async {
      //     mockClient = MockClient();

      //     when(
      //       () async => await mockClient.get(
      //           Uri.parse('https://6735d1185995834c8a94350f.mockapi.io/api/v1/gas_sale/cylinders')
      //         ),
      //       ).thenAnswer(
      //         (answer) => () async => http.Response('{}', 200),
      //       );
      //     });

      //     expect(cylinderRepository.fetchCategory(), isA<CylinderModel>());
      //   // test("Testing for the success code 200 test case", () async {
      //   //   when(
      //   //     () => mockAPICall.get(
      //   //         Uri.parse('https://6735d1185995834c8a94350f.mockapi.io/api/v1/gas_sale/cylinders')
      //   //       ),
      //   //     ).thenAnswer(
      //   //       (_) async => http.Response('{}', 200),
      //   //     );

      //   //     final cylinder = await cylinderRepository.fetchCategory().then((value) => value.first);

      //   //     expect(cylinder, isA<CylinderModel>());
      //   //   }
      //   // );
      // });
		},
	);
}