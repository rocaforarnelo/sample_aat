import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_app/features/upload_photo/domain/core/failure.dart';
import 'package:photo_app/features/upload_photo/domain/repositories/add_photo_repository.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';

abstract class GetPhotosUseCase {
  Future<Either<Failure, List<Photo>>> call();
}

@LazySingleton(as: GetPhotosUseCase)
class GetPhotosUseCaseImpl implements GetPhotosUseCase {
  final AddPhotoRepository addPhotoRepository;

  GetPhotosUseCaseImpl({required this.addPhotoRepository});

  @override
  Future<Either<Failure, List<Photo>>> call() {
    return addPhotoRepository.getPhotos();
  }
}
