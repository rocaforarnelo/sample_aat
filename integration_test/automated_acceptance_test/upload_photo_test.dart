import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';

import 'domain_specific_language/photo_dsl.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => {GetIt.instance.reset()});

  testWidgets(
    'When the User add a Photo to be uploaded\n'
    'Then the Photo will be added to the List of Photo(s) to be uploaded',
    (tester) async {
      final photoUploader = PhotoDsl(
        tester,
      );
      await photoUploader.initialize();
      await photoUploader.addPhoto();
      await photoUploader.confirmPhotoAdded(1);
    },
  );

  testWidgets(
    'Given list of Photos'
    'When the user upload photo'
    'Then show upload confirmation',
    (tester) async {
      final photoUploader = PhotoDsl(
        tester,
      );
      await photoUploader.initialize();
      await photoUploader.addPhoto();
      await photoUploader.uploadPhotos();
      await photoUploader.confirmPhotosUploaded();
    },
  );
}
