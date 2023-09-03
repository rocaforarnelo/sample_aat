part of 'photo_list_cubit_cubit.dart';

abstract class PhotoListCubitState extends Equatable {
  const PhotoListCubitState();

  @override
  List<Object> get props => [];
}

class PhotoListCubitInitial extends PhotoListCubitState {}

class PhotoListCubitReadyForUpload extends PhotoListCubitState {
  final List<Photo> photos;

  const PhotoListCubitReadyForUpload(this.photos);
}

class PhotoListUploading extends PhotoListCubitState {}

class PhotoListConfirmedUploaded extends PhotoListCubitState {
  final UploadPhotoConfirmation uploadPhotoConfirmation;

  const PhotoListConfirmedUploaded(this.uploadPhotoConfirmation);
}
