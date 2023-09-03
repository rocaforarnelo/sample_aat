import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:photo_app/core/infra/image_picker/fake_image_picker_impl.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';
import 'package:photo_app/features/upload_photo/presentation/screens/upload_photo/widgets/selected_photo_card.dart';

import '../../../../core/utils/widget_tester_extension.dart';

void main() {
  const String widgetName = 'SelectPhotoCard';
  group(
    '$widgetName Widget Tests: ',
    () {
      SelectedPhotoCard selectedPhotoCard = SelectedPhotoCard(
        photo: Photo(
          name: 'Photo 1',
          imageBytes: Uint8List.fromList(testBytes),
        ),
      );

      testWidgets(
        'Style test',
        (WidgetTester tester) async {
          await tester.pumpThemedWidget(selectedPhotoCard);
          BoxDecoration decoration = tester
              .widget<Container>(find.byType(Container))
              .decoration as BoxDecoration;
          expect(decoration.image!.fit!, BoxFit.fill);
          expect((decoration.image!.image as MemoryImage).bytes,
              Uint8List.fromList(testBytes));
          expect(find.byIcon(Icons.cancel), findsOneWidget);
        },
      );
    },
  );
}
