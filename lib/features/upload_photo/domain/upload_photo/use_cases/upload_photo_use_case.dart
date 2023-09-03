import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_app/features/upload_photo/domain/core/failure.dart';
import 'package:photo_app/features/upload_photo/domain/repositories/upload_photo_repository.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/upload_photo_confirmation.dart';

abstract class UploadPhotoUseCase {
  Future<Either<Failure, UploadPhotoConfirmation>> call(List<Photo> photos);
}

@LazySingleton(as: UploadPhotoUseCase)
class UploadPhotoUseCaseImpl implements UploadPhotoUseCase {
  final UploadPhotoRepository repository;

  UploadPhotoUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, UploadPhotoConfirmation>> call(
      List<Photo> photos) async {
    return repository.uploadPhotos(photos);
  }
}
