import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_app/core/presentation/constants/strings.dart';
import 'package:photo_app/core/presentation/theme/colors.dart';
import 'package:photo_app/core/presentation/widgets/primary_button.dart';
import 'package:photo_app/features/upload_photo/domain/upload_photo/entities/photo.dart';
import 'package:photo_app/features/upload_photo/presentation/photo_list/bloc/photo_bloc.dart';
import 'package:photo_app/features/upload_photo/presentation/screens/upload_photo/widgets/comments_panel.dart';
import 'package:photo_app/features/upload_photo/presentation/screens/upload_photo/widgets/details_panel.dart';
import 'package:photo_app/features/upload_photo/presentation/screens/upload_photo/widgets/location_button.dart';
import 'package:photo_app/features/upload_photo/presentation/screens/upload_photo/widgets/photo_panel.dart';
import 'package:photo_app/features/upload_photo/presentation/screens/upload_photo/widgets/upload_photo_subtitle.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(Icons.close)),
        title: const Text(
          Strings.uploadScreenTitle,
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
          child: BlocConsumer<PhotoBloc, PhotoState>(
        listener: (context, state) {
          if (state is PhotosUploaded) {
            final snackBar = SnackBar(
              content: Text(state.confirmation.message),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state is PhotoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Photo> photos =
                (state is PhotoReadyForUpload) ? state.photos : [];
            return UploadPhotoScreenBody(
              photos: photos,
            );
          }
        },
      )),
    );
  }
}

class UploadPhotoScreenBody extends StatelessWidget {
  final List<Photo> photos;
  const UploadPhotoScreenBody({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const LocationButton(
          location: '20041075|TAP-NS TAP-North Strathfield',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 22),
              child: Column(
                children: [
                  const UploadPhotoSubtitle(
                    subtitle: Strings.uploadScreenSubtitle,
                  ),
                  PhotosPanel(
                    photos: photos,
                    onPhotoSelected: (File photo) {
                      context.read<PhotoBloc>().add(AddPhotoEvent(photo.path));
                    },
                  ),
                  const CommentsPanel(),
                  const DetailsPanel(),
                  PrimaryButton(
                      onPressed: photos.isEmpty
                          ? null
                          : () {
                              context
                                  .read<PhotoBloc>()
                                  .add(UploadPhotosEvent(photos));
                            },
                      label: Strings.next)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
