import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String label;

  const PrimaryTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey,
        contentPadding: EdgeInsets.zero,
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
