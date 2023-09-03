import 'dart:io';

abstract class AppImagePicker {
  Future<File?> pickImage();
}
