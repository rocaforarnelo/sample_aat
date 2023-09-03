import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:photo_app/features/upload_photo/data/data_sources/add_photo/add_photo_datasource.dart';
import 'package:photo_app/features/upload_photo/data/models/photo_model.dart';

@LazySingleton(as: AddPhotoDataSource)
class InMemoryPhotoDataSource extends AddPhotoDataSource {
  List<PhotoModel> currentPhotos = [];

  @override
  Future<List<PhotoModel>> addPhoto(String path) async {
    File photoFile = File(path);
    currentPhotos.add(
      PhotoModel.fromBytes(
        path,
        photoFile.readAsBytesSync(),
      ),
    );
    return currentPhotos;
  }

  @override
  Future<List<PhotoModel>> getPhotos() async {
    return currentPhotos;
  }
}
