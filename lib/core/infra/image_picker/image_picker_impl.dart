import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:photo_app/core/infra/image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';

@LazySingleton(as: AppImagePicker, env: [Environment.prod])
class ImagePickerImpl implements AppImagePicker {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<File?> pickImage() async {
    XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file != null ? File(file.path) : null;
  }
}
