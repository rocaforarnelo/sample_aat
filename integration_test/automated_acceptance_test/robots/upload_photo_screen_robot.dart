import 'package:flutter_test/flutter_test.dart';
import 'package:photo_app/core/presentation/widgets/primary_button.dart';
import 'package:photo_app/features/upload_photo/presentation/screens/upload_photo/upload_photo_screen.dart';
import 'package:photo_app/features/upload_photo/presentation/screens/upload_photo/widgets/selected_photo_card.dart';

import 'robots.dart';

class UploadPhotoScreenRobot extends Robot {
  UploadPhotoScreenRobot(super.tester, super.dsl);

  Future<void> showNextButton() async {
    await tester.dragUntilVisible(
      find.widgetWithText(PrimaryButton, 'Next'),
      find.byType(UploadPhotoScreenBody),
      const Offset(-250, 0),
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapAddPhotoButton() async {
    await tester.tap(
      find.byWidgetPredicate((widget) =>
          (widget is PrimaryButton) && widget.label == 'Add a photo'),
    );
    await tester.pumpAndSettle();
  }

  Future<void> uploadPhotosButton() async {
    await tester.tap(
      _findNextButton(),
    );
    await tester.pumpAndSettle();
  }

  Finder _findNextButton({bool skipOffstage = true}) {
    return find.byWidgetPredicate(
      (widget) => (widget is PrimaryButton) && widget.label == 'Next',
      skipOffstage: skipOffstage,
    );
  }

  Future<void> findSelectedPhotoCard(int count) async {
    expect(find.byType(SelectedPhotoCard), findsNWidgets(count));
  }

  Future<void> findUploadConfirmation() async {
    expect(find.text('Photos uploaded'), findsOneWidget);
  }

  Future<void> scrollToNextButton() async {
    await tester.dragUntilVisible(
      _findNextButton(skipOffstage: false),
      find.byType(UploadPhotoScreenBody, skipOffstage: false),
      const Offset(-250, 0),
    );
    await tester.pumpAndSettle();
  }
}
