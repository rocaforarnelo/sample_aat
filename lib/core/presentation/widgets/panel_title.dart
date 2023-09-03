import 'package:flutter/material.dart';

class PanelTitle extends StatelessWidget {
  final String title;

  const PanelTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
            fontWeight: FontWeight.w900,
          ),
        ),
        const Divider()
      ],
    );
  }
}
