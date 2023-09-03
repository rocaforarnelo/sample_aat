import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtensions on WidgetTester {
  Future<MaterialApp> pumpThemedWidget(
    Widget widget,
  ) async {
    return await pumpThemedScreen(
      Scaffold(
        body: widget,
      ),
    );
  }

  Future<MaterialApp> pumpThemedScreen(Widget widget) async {
    final app = MaterialApp(
      home: widget,
    );
    await pumpWidget(
      app,
    );
    return app;
  }
}
