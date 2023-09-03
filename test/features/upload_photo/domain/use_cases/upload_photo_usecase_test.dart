import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:photo_app/features/upload_photo/domain/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_app/features/upload_photo/domain/repositories/upload_photo_repository.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/upload_photo_confirmation.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/use_cases/upload_photo_use_case.dart';

class FakeUploadPhotoRepository extends UploadPhotoRepository {
  @override
  Future<Either<Failure, UploadPhotoConfirmation>> uploadPhotos(
      List<Photo> photos) async {
    return const Right(UploadPhotoConfirmation('Success uploading photo!'));
  }
}

void main() {
  test(
    'Should return UploadPhotoConfirmation when uploading photos',
    () async {
      //* Arrange
      final photos = [
        Photo(name: 'Photo 1', imageBytes: Uint8List.fromList([])),
        Photo(name: 'Photo 2', imageBytes: Uint8List.fromList([])),
        Photo(name: 'Photo 3', imageBytes: Uint8List.fromList([]))
      ];
      UploadPhotoUseCaseImpl usecase =
          UploadPhotoUseCaseImpl(FakeUploadPhotoRepository());
      //* Act
      final result = await usecase(photos);
      result.fold((left) {}, (right) {
        //* Assert
        expect(
            const UploadPhotoConfirmation('Success uploading photo!'), right);
      });
    },
  );
}
