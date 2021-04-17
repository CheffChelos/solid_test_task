import 'package:flutter/material.dart';

abstract class ColorState {}

class ColorLoadedState extends ColorState {
  Color color;

  ColorLoadedState({this.color});
}
