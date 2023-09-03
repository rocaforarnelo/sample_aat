import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_app/core/infra/image_picker/image_picker.dart';
import 'package:photo_app/core/presentation/constants/strings.dart';
import 'package:photo_app/core/presentation/injection/injector.dart';
import 'package:photo_app/core/presentation/theme/colors.dart';
import 'package:photo_app/core/presentation/widgets/card_panel.dart';
import 'package:photo_app/core/presentation/widgets/primary_button.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';
import 'package:photo_app/features/upload_photo/presentation/screens/upload_photo/widgets/selected_photo_card.dart';

class PhotosPanel extends StatelessWidget {
  final List<Photo> photos;
  final Function(File photo) onPhotoSelected;

  const PhotosPanel({
    super.key,
    required this.photos,
    required this.onPhotoSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CardPanel(
      title: Strings.addPhotoTitle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          photos.isEmpty
              ? const SizedBox.shrink()
              : SizedBox.fromSize(
                  size: const Size.fromHeight(50),
                  child: ListView.separated(
                    itemCount: photos.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, count) {
                      return SelectedPhotoCard(
                        photo: photos[count],
                      );
                    },
                    separatorBuilder: (context, count) {
                      return SizedBox.fromSize(size: const Size.fromWidth(12));
                    },
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: PrimaryButton(
                onPressed: () async {
                  File? photoFile = await locator<AppImagePicker>().pickImage();
                  if (photoFile != null) {
                    onPhotoSelected(photoFile);
                  }
                },
                label: Strings.addPhotoButtonLabel),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  Strings.addPhotoInclusionLabel,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Icon(
                  Icons.check_box,
                  color: CustomColors.primary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
