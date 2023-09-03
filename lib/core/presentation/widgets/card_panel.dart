import 'package:flutter/material.dart';
import 'package:photo_app/core/presentation/widgets/panel_title.dart';

class CardPanel extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsets padding;

  const CardPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(12, 12, 12, 25),
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13.0),
      child: Card(
        elevation: 6,
        child: Padding(
            padding: padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [PanelTitle(title: title), child],
            )),
      ),
    );
  }
}
