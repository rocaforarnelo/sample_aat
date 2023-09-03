import 'package:photo_app/features/upload_photo/data/models/photo_model.dart';

abstract class AddPhotoDataSource {
  Future<List<PhotoModel>> addPhoto(String path);

  Future<List<PhotoModel>> getPhotos();
}
