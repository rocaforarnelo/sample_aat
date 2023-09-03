import 'package:flutter_test/flutter_test.dart';

import '../domain_specific_language/photo_dsl.dart';

abstract class Robot {
  final WidgetTester tester;
  final PhotoDsl dsl;

  ///{@macro Robot}
  Robot(this.tester, this.dsl);
}
