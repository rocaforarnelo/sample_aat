import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  final String location;

  const LocationButton({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          12.0,
          12.0,
          0.0,
          12.0,
        ),
        child: Row(
          children: [
            const Icon(Icons.location_on),
            Text(location),
          ],
        ),
      ),
    );
  }
}
