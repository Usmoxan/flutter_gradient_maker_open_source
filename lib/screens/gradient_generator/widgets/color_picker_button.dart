import 'package:flutter/material.dart';

class ColorPickerButton extends StatefulWidget {
  final Color color;

  const ColorPickerButton({
    super.key,
    required this.color,
  });

  @override
  State<ColorPickerButton> createState() => _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorPickerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: widget.color,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
