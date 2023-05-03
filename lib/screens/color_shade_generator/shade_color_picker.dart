// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:flutter/material.dart';

import '../gradient_generator/widgets/color_picker_dialog.dart';

class ColorPicker extends StatefulWidget {
  final ValueChanged<Color> onColorChanged;

  const ColorPicker({super.key, required this.onColorChanged});

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  var _colorNotifier;

  late Color _currentColor;

  @override
  void initState() {
    _currentColor = const Color(0xff808080);
    Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        loopTime();
      },
    );

    super.initState();
  }

  void loopTime() {
    _colorNotifier = ValueNotifier<Color>(_currentColor);
  }

  void _showDialog1() {
    showDialog(
      context: context,
      builder: (context) {
        return ColorPickerDialog(
          colorNotifier: _colorNotifier!,
          onColorChanged: (color) {
            setState(() {
              _currentColor = color;
              widget.onColorChanged(_currentColor);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Select a color:',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: _showDialog1,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: _currentColor,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ],
    );
  }
}
