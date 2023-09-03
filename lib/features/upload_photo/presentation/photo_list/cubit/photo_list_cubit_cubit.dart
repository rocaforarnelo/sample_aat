// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/upload_photo_confirmation.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/use_cases/add_photo_use_case.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/use_cases/get_photos_use_case.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/use_cases/upload_photo_use_case.dart';

part 'photo_list_cubit_state.dart';

@Injectable()
class PhotoListCubit extends Cubit<PhotoListCubitState> {
  final AddPhotoUseCase addPhotoUseCase;
  final GetPhotosUseCase getPhotosUseCase;
  final UploadPhotoUseCase uploadPhotoUseCase;

  PhotoListCubit({
    required this.addPhotoUseCase,
    required this.uploadPhotoUseCase,
    required this.getPhotosUseCase,
  }) : super(PhotoListCubitInitial());

  Future<void> init() async {
    final photos = await _getPhotos();
    if (photos.isNotEmpty) {
      emit(PhotoListCubitReadyForUpload(photos));
    }
  }

  Future<List<Photo>> _getPhotos() async {
    await getPhotosUseCase().then((result) => {
          result.fold(
              (failure) => {
                    //No Error handling for now
                  }, (List<Photo> photos) {
            return photos;
          })
        });
    return [];
  }

  Future<void> uploadPhotos() async {
    final photos = await _getPhotos();
    emit(PhotoListUploading());
    await uploadPhotoUseCase(photos).then(
      (result) => {
        result.fold(
            (failure) => {},
            (uploadConfirmation) =>
                {emit(PhotoListConfirmedUploaded(uploadConfirmation))}),
      },
    );
  }

  Future<void> addPhoto(String path) async {
    await addPhotoUseCase(path).then(
      (result) => {
        result.fold(
            (failure) => {},
            (photos) => {
                  if (photos.isNotEmpty)
                    {
                      emit(PhotoListCubitReadyForUpload(photos)),
                    }
                }),
      },
    );
  }
}
