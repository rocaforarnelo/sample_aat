import 'package:injectable/injectable.dart';
import 'package:photo_app/features/upload_photo/data/data_sources/add_photo/add_photo_datasource.dart';
import 'package:photo_app/features/upload_photo/domain/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_app/features/upload_photo/domain/repositories/add_photo_repository.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';

@LazySingleton(as: AddPhotoRepository)
class AddPhotoRepositoryImpl extends AddPhotoRepository {
  final AddPhotoDataSource dataSource;

  AddPhotoRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<Photo>>> addPhoto(String path) async {
    final photos = await dataSource.addPhoto(path);
    return Right(photos);
  }

  @override
  Future<Either<Failure, List<Photo>>> getPhotos() async {
    final photos = await dataSource.getPhotos();
    return Right(photos);
  }
}
