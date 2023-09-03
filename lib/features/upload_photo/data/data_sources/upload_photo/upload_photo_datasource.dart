import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/upload_photo_confirmation.dart';

abstract class UploadPhotoDataSource {
  Future<UploadPhotoConfirmation> uploadPhotos(List<Photo> photos);
}
