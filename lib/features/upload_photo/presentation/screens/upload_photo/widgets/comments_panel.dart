import 'package:flutter/material.dart';
import 'package:photo_app/core/presentation/constants/strings.dart';
import 'package:photo_app/core/presentation/widgets/card_panel.dart';
import 'package:photo_app/core/presentation/widgets/primary_text_field.dart';

class CommentsPanel extends StatelessWidget {
  const CommentsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardPanel(
      title: Strings.commentsTitle,
      child: PrimaryTextField(
        label: Strings.commentsTitle,
      ),
    );
  }
}
