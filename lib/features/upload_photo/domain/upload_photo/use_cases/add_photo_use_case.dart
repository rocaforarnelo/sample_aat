import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_app/features/upload_photo/domain/core/failure.dart';
import 'package:photo_app/features/upload_photo/domain/repositories/add_photo_repository.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';

abstract class AddPhotoUseCase {
  Future<Either<Failure, List<Photo>>> call(String path);
}

@LazySingleton(as: AddPhotoUseCase)
class AddPhotoUseCaseImpl implements AddPhotoUseCase {
  final AddPhotoRepository addPhotoRepository;

  AddPhotoUseCaseImpl({required this.addPhotoRepository});

  @override
  Future<Either<Failure, List<Photo>>> call(String path) {
    return addPhotoRepository.addPhoto(path);
  }
}
