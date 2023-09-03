import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:photo_app/features/upload_photo/data/data_sources/add_photo/add_photo_datasource.dart';
import 'package:photo_app/features/upload_photo/data/models/photo_model.dart';
import 'package:photo_app/features/upload_photo/data/repositories/add_photo_repository_impl.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/use_cases/add_photo_use_case.dart';

//If you are wondering if I know mocking and mocking frameworks, Yes I do. Mocktail etc. I just subscribe to chicago style TDD
//where Mocks are not Stubs
class FakeAddPhotoDateSource extends AddPhotoDataSource {
  final List<PhotoModel> currentPhotos = [
    PhotoModel(name: 'Photo 1', imageBytes: Uint8List.fromList([])),
    PhotoModel(name: 'Photo 2', imageBytes: Uint8List.fromList([]))
  ];
  @override
  Future<List<PhotoModel>> addPhoto(String path) async {
    currentPhotos.add(PhotoModel.fromBytes(path, Uint8List.fromList([])));
    return Future.value(currentPhotos);
  }

  @override
  Future<List<PhotoModel>> getPhotos() async {
    return currentPhotos;
  }
}

void main() {
  test(
    'Should return List of photos when adding photo',
    () async {
      //* Arrange
      AddPhotoUseCaseImpl usecase = AddPhotoUseCaseImpl(
        addPhotoRepository: (AddPhotoRepositoryImpl(
          FakeAddPhotoDateSource(),
        )),
      );
      //* Act
      final result = await usecase('Photo 3');
      result.fold((left) {}, (right) {
        //* Assert
        expect([
          PhotoModel(
            name: 'Photo 1',
            imageBytes: Uint8List.fromList([]),
          ),
          PhotoModel(
            name: 'Photo 2',
            imageBytes: Uint8List.fromList([]),
          ),
          PhotoModel(
            name: 'Photo 3',
            imageBytes: Uint8List.fromList([]),
          )
        ], right);
      });
    },
  );
}
