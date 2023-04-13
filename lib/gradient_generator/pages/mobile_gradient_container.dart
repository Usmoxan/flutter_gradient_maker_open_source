import 'package:flutter/material.dart';

class MobileGradientContainer extends StatelessWidget {
  const MobileGradientContainer({
    super.key,
    required this.isLinearStyle,
    required Color color1,
    required Color color2,
    required this.begin,
    required this.end,
  })  : _color1 = color1,
        _color2 = color2;

  final bool isLinearStyle;
  final Color _color1;
  final Color _color2;
  final Alignment begin;
  final Alignment end;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        gradient: isLinearStyle
            ? LinearGradient(colors: [_color1, _color2], begin: begin, end: end)
            : RadialGradient(
                colors: [_color1, _color2], center: begin, radius: 0.8),
      ),
    );
  }
}
