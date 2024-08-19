import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';

class PixelDecoration {
  static var shapeDecoration = ShapeDecoration(
    shape: PixelBorder.solid(
        color: Colors.black,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        pixelSize: 2),
  );
}
