import 'package:flutter_test/flutter_test.dart';
import 'package:gas_sale/views/loading/loading_screen.dart';
import 'package:integration_test/integration_test.dart';
import 'package:gas_sale/main.dart' as app;

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Sample Integration Test (TODO:: Finish working on it)
  group(
    "Integration testing for loading screen",
    (){
      app.main();
      testWidgets("Verify loading and moves to HomeScreen", (tester) async {
        tester.pumpAndSettle(); // Makes sure app is rendered completely and no frame is left unrendered
        expect(LoadingScreen, findsOne);
        await Future.delayed(const Duration(seconds: 3));
      });
    }
  );
}