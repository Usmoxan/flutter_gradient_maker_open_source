import 'package:flutter/material.dart';

class StyleSelectorRow extends StatelessWidget {
  final bool isLinearStyle;
  final Color selectedColor;
  final void Function() onLinearPressed;
  final void Function() onRadialPressed;

  const StyleSelectorRow({
    Key? key,
    required this.isLinearStyle,
    required this.selectedColor,
    required this.onLinearPressed,
    required this.onRadialPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          style: ButtonStyle(
            backgroundColor: isLinearStyle
                ? MaterialStateProperty.all(selectedColor)
                : MaterialStateProperty.all(Colors.white),
          ),
          onPressed: onLinearPressed,
          child: const Text(
            "Linear",
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(width: 10),
        OutlinedButton(
          style: ButtonStyle(
            backgroundColor: isLinearStyle
                ? MaterialStateProperty.all(Colors.white)
                : MaterialStateProperty.all(selectedColor),
          ),
          onPressed: onRadialPressed,
          child: const Text(
            "Radial",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
