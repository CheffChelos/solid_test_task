import 'dart:math';

import 'package:flutter/material.dart';

class ColorProvider {
  List<Color> _colors = [
    Colors.black12,
    Colors.blueGrey,
    Colors.teal,
    Colors.redAccent,
    Colors.amberAccent,
  ];

  Color _currentColor;

  void changeColor() {
    Random random = Random();
    int index = random.nextInt(_colors.length);
    if (_colors[index] == _currentColor) {
      index--;
      index = index.abs();
    }
    _currentColor = _colors[index];
  }

  Color get getColor => _currentColor ??= _colors[0];
}
