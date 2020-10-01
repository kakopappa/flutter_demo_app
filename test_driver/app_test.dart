// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Reverse App', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
 
    test('increments the counter', () async {
      var textFieldInput = find.byValueKey('textFieldInput');
      var reverseButton = find.byValueKey('reverseButton');
      var reverseText = find.byValueKey('reverseText');

      await driver.tap(textFieldInput);  // acquire focus

      await driver.enterText('Hello!');  // enter text

      await Future.delayed(Duration(seconds: 1), () {});

      await driver.tap(reverseButton);  // click on the reverse butoon

      await Future.delayed(Duration(seconds: 1), () {});

      expect(await driver.getText(reverseText), "!olleH");  // verify text appears on UI 
      
    });
  });
}

// flutter drive --target=test_driver/app.dart