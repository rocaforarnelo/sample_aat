import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

class Photo extends Equatable {
  final String name;
  final Uint8List imageBytes;

  const Photo({
    required this.name,
    required this.imageBytes,
  });

  @override
  List<Object?> get props => [name];
}
