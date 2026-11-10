import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final String imagePath;
  const HeaderImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: double.infinity,
      height: 240,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        // Fallback placeholder container if image asset is not loaded
        return Container(
          height: 240,
          color: Colors.pink.shade100,
          child: const Center(
            child: Icon(Icons.directions_boat, size: 80, color: Colors.pink),
          ),
        );
      },
    );
  }
}