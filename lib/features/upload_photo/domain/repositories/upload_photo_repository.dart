import 'package:dartz/dartz.dart';
import 'package:photo_app/features/upload_photo/domain/core/failure.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/upload_photo_confirmation.dart';

abstract class UploadPhotoRepository {
  Future<Either<Failure, UploadPhotoConfirmation>> uploadPhotos(
      List<Photo> photos);
}
