import 'package:injectable/injectable.dart';
import 'package:photo_app/features/upload_photo/data/data_sources/upload_photo/upload_photo_datasource.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/upload_photo_confirmation.dart';

@LazySingleton(as: UploadPhotoDataSource, env: [Environment.test])
class FakeUploadPhotoRemoteDataSource extends UploadPhotoDataSource {
  @override
  Future<UploadPhotoConfirmation> uploadPhotos(List<Photo> photos) async {
    return const UploadPhotoConfirmation('Photos uploaded');
  }
}
