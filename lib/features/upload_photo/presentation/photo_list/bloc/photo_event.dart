part of 'photo_bloc.dart';

class PhotoEvent extends Equatable {
  const PhotoEvent([List props = const <dynamic>[]]);

  @override
  List<Object> get props => [];
}

class AddPhotoEvent extends PhotoEvent {
  final String path;

  AddPhotoEvent(this.path) : super([path]);
}

class UploadPhotosEvent extends PhotoEvent {
  final List<Photo> photos;

  UploadPhotosEvent(this.photos) : super([photos]);
}
