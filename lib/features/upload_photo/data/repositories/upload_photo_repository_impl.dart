import 'package:injectable/injectable.dart';
import 'package:photo_app/features/upload_photo/data/data_sources/upload_photo/upload_photo_datasource.dart';
import 'package:photo_app/features/upload_photo/domain/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_app/features/upload_photo/domain/repositories/upload_photo_repository.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/upload_photo_confirmation.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';

@LazySingleton(as: UploadPhotoRepository)
class UploadPhotoRepositoryImpl extends UploadPhotoRepository {
  final UploadPhotoDataSource dataSource;

  UploadPhotoRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, UploadPhotoConfirmation>> uploadPhotos(
      List<Photo> photos) async {
    final confirmation = await dataSource.uploadPhotos(photos);
    return Right(confirmation);
  }
}
