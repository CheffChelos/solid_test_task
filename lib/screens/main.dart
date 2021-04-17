import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_application/bloc/color_bloc.dart';
import 'package:test_application/bloc/color_event.dart';
import 'package:test_application/bloc/color_state.dart';
import 'package:test_application/services/color_provider.dart';

class MainScreen extends StatelessWidget {
  final ColorProvider _colorProvider = ColorProvider();

  void onGestureTap(ColorBloc colorBloc) {
    colorBloc.add(ColorChangeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ColorBloc>(
      create: (context) => ColorBloc(colorProvider: _colorProvider),
      child: Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
        ),
        body: BlocBuilder<ColorBloc, ColorState>(
          builder: (context, state) {
            final ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
            return GestureDetector(
              onTap: () => onGestureTap(colorBloc),
              child: SafeArea(
                child: Container(
                  color: state is ColorLoadedState ? state.color : Colors.white,
                  child: Center(
                    child: Text('Hello there'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
