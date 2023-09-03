part of 'photo_bloc.dart';

class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoReadyForUpload extends PhotoState {
  final List<Photo> photos;

  const PhotoReadyForUpload(this.photos);
}

class PhotosUploaded extends PhotoState {
  final UploadPhotoConfirmation confirmation;

  const PhotosUploaded(this.confirmation);
}
