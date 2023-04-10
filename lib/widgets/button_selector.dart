import 'package:flutter/material.dart';

class OutlinedButtonSelection extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color bgColor;

  const OutlinedButtonSelection({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(bgColor)),
        onPressed: onPressed,
        child: Icon(
          icon,
          size: 15,
          color: Colors.black,
        ));
  }
}
