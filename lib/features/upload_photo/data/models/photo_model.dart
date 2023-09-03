import 'package:flutter/services.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';

class PhotoModel extends Photo {
  const PhotoModel({required super.name, required super.imageBytes});

  factory PhotoModel.fromBytes(String name, Uint8List imageBytes) {
    return PhotoModel(name: name, imageBytes: imageBytes);
  }
}
