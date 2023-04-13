import 'package:flutter/material.dart';

class ColorModel {
  Color _color;

  ColorModel({required Color color}) : _color = color;

  Color get color => _color;

  set color(Color color) {
    _color = color;
  }

  List<Color> get shades {
    final hslColor = HSLColor.fromColor(_color);
    final lightnessValues = List.generate(10, (index) => (index + 1) * 0.1);
    return lightnessValues
        .map((lightness) => hslColor.withLightness(lightness).toColor())
        .toList();
  }
}
