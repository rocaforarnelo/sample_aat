import 'package:flutter/material.dart';
import 'package:photo_app/core/presentation/constants/strings.dart';
import 'package:photo_app/core/presentation/widgets/card_panel.dart';
import 'package:photo_app/core/presentation/widgets/dropdown_field.dart';
import 'package:photo_app/core/presentation/widgets/primary_text_field.dart';

class DetailsPanel extends StatelessWidget {
  const DetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return CardPanel(
        title: Strings.detailsTitle,
        child: Column(
          children: const [
            DropDownField(
              label: '2020-06-29',
            ),
            DropDownField(
              label: 'Select Area',
            ),
            DropDownField(
              label: 'Task Category',
            ),
            PrimaryTextField(label: 'Tags')
          ],
        ));
  }
}
