import '../robots/upload_photo_screen_robot.dart';
import 'dsl.dart';

class PhotoDsl extends Dsl {
  PhotoDsl(super.tester);

  late UploadPhotoScreenRobot uploadPhotoScreenRobot;

  @override
  Future<void> initialize() {
    setUpDrivers();
    return super.initialize();
  }

  void setUpDrivers() {
    uploadPhotoScreenRobot = UploadPhotoScreenRobot(tester, this);
  }

  Future<void> addPhoto() async {
    await uploadPhotoScreenRobot.tapAddPhotoButton();
  }

  Future<void> uploadPhotos() async {
    await uploadPhotoScreenRobot.scrollToNextButton();
    await uploadPhotoScreenRobot.uploadPhotosButton();
  }

  Future<void> confirmPhotoAdded(int count) async {
    await uploadPhotoScreenRobot.findSelectedPhotoCard(count);
  }

  Future<void> confirmPhotosUploaded() async {
    await uploadPhotoScreenRobot.findUploadConfirmation();
  }
}
