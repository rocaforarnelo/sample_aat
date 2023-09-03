import 'package:equatable/equatable.dart';

class UploadPhotoConfirmation extends Equatable {
  final String message;

  const UploadPhotoConfirmation(this.message);

  @override
  List<Object?> get props => [message];
}
