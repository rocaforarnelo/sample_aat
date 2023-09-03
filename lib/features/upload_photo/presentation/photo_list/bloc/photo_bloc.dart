// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/upload_photo_confirmation.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/use_cases/add_photo_use_case.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/use_cases/get_photos_use_case.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/use_cases/upload_photo_use_case.dart';

part 'photo_event.dart';
part 'photo_state.dart';

@Injectable()
class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc(
      {required this.addPhotoUseCase,
      required this.getPhotosUseCase,
      required this.uploadPhotoUseCase})
      : super(PhotoInitial()) {
    on<AddPhotoEvent>(addPhoto);
    on<UploadPhotosEvent>(uploadPhoto);
  }

  final AddPhotoUseCase addPhotoUseCase;
  final GetPhotosUseCase getPhotosUseCase;
  final UploadPhotoUseCase uploadPhotoUseCase;

  PhotoState get initialState => PhotoInitial();

  Future<void> addPhoto(AddPhotoEvent event, Emitter<PhotoState> emit) async {
    emit(PhotoLoading());
    await addPhotoUseCase(event.path).then(
      (result) => {
        result.fold(
            (failure) => {},
            (photos) => {
                  if (photos.isNotEmpty)
                    {
                      emit(PhotoReadyForUpload(photos)),
                    }
                }),
      },
    );
  }

  Future<void> uploadPhoto(
      UploadPhotosEvent event, Emitter<PhotoState> emit) async {
    emit(PhotoLoading());
    await uploadPhotoUseCase(event.photos).then(
      (result) => {
        result.fold(
            (failure) => {},
            (confirmation) => {
                  emit(
                    PhotosUploaded(confirmation),
                  ),
                }),
      },
    );
    emit(PhotoReadyForUpload(event.photos));
  }
}
