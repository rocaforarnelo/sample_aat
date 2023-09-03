import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_app/main.dart';

class Dsl {
  WidgetTester tester;

  Dsl(this.tester) {
    tester = tester;
  }

  Future<void> initialize() async {
    await startApp(Environment.test);
    await tester.pumpAndSettle();
  }
}
