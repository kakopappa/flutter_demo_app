// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_app/main.dart';
import 'package:test_app/reverse.dart';

void main() {
  group('Widgets tests', () {
    testWidgets('test reverse label', (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(MyApp());

        // Make sure our button and TextField is present
        expect(find.byType(FlatButton), findsOneWidget);
        expect(find.byType(TextField), findsOneWidget);

        // Enter Hello
        await tester.enterText(find.byKey(new Key('textFieldInput')), "HELLO");

        // Tap the button
        await tester.tap(find.byType(FlatButton));
        
        await tester.pump();

        // expect OLLEH
        expect(find.text('OLLEH'), findsOneWidget);
      });
  });
   

   group('Reverse', () {
      test('when_doit_expect_OLLEH', () {
        final result = Reverse.doit("HELLO");
        expect(result, "OLLEH");
      });
   });

  
}
