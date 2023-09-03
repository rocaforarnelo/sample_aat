import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_app/features/upload_photo/data/data_sources/upload_photo/upload_photo_datasource.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/upload_photo_confirmation.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';

@LazySingleton(as: UploadPhotoDataSource, env: [Environment.prod])
class UploadPhotoRemoteDataSource extends UploadPhotoDataSource {
  @override
  Future<UploadPhotoConfirmation> uploadPhotos(List<Photo> photos) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://reqres.in/api/',
      ),
    );
    // ignore: unused_local_variable
    Response response;
    try {
      response = await dio.get('users');

      return const UploadPhotoConfirmation('Photos uploaded');
      // ignore: unused_catch_clause
    } on DioException catch (e) {
      throw Exception();
    }
  }
}
