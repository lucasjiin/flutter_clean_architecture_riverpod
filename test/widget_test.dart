// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app_flutter/application.dart';
import 'package:app_flutter/core/configs.dart';
import 'package:app_flutter/core/dependencies.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

final _logTag = 'main';

void main() async {
  await dotenv.load(fileName: "assets/config/.env");

  logger.debug(_logTag, 'start mode ${getMode()}');

  testWidgets('test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Application());

    // Verify that our counter starts at 0.
    expect(find.text('home'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.arrow_back));
    // await tester.pump();

    // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
