import 'package:flutter/material.dart';

class UploadPhotoSubtitle extends StatelessWidget {
  final String subtitle;

  const UploadPhotoSubtitle({super.key, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Icon(Icons.help, color: Colors.grey, size: 20)
        ],
      ),
    );
  }
}
