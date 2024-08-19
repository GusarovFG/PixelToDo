import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';

class PixelDecoration {
  static ShapeDecoration shapeDecoration(BuildContext context) {
    return ShapeDecoration(
      shape: PixelBorder.solid(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          pixelSize: 2),
    );
  }
}
