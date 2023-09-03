import 'package:flutter/material.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';

class SelectedPhotoCard extends StatelessWidget {
  final Photo photo;

  const SelectedPhotoCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 50,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: MemoryImage(photo.imageBytes),
              ),
            ),
          ),
          const Positioned(
            top: -10,
            right: -10,
            child: Icon(
              Icons.cancel,
            ),
          ),
        ],
      ),
    );
  }
}
