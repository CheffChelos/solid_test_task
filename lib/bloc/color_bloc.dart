import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_application/bloc/color_event.dart';
import 'package:test_application/bloc/color_state.dart';
import 'package:test_application/services/color_provider.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final ColorProvider colorProvider;

  ColorBloc({this.colorProvider}) : super(null);

  @override
  Stream<ColorState> mapEventToState(ColorEvent event) async* {
    if (event is ColorChangeEvent) {
      colorProvider.changeColor();
      Color color = colorProvider.getColor;
      yield ColorLoadedState(color: color);
    } else {
      Color color = colorProvider.getColor;
      yield ColorLoadedState(color: color);
    }
  }
}
