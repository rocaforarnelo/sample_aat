import 'package:dartz/dartz.dart';
import 'package:photo_app/features/upload_photo/domain/core/failure.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';

abstract class AddPhotoRepository {
  Future<Either<Failure, List<Photo>>> addPhoto(String path);

  Future<Either<Failure, List<Photo>>> getPhotos();
}
