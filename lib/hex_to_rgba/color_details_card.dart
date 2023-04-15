import 'package:flutter/material.dart';

class ColorDetails extends StatelessWidget {
  final Color color;

  const ColorDetails({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    final hslColor = HSLColor.fromColor(color);
    final hexColor =
        '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
    final rgbaColor =
        'rgba(${color.red}, ${color.green}, ${color.blue}, ${(1.0 * color.alpha / 255).toStringAsFixed(2)})';

    final luminance = color.computeLuminance();

    ColorType type;
    if (luminance > 0.5) {
      type = ColorType.Light;
    } else {
      type = ColorType.Dark;
    }

    var children2 = [
      const Text(
        "Color info:",
        style: TextStyle(fontSize: 20),
      ),
      const SizedBox(height: 10),
      _buildColorRow('HEX: ', hexColor),
      const SizedBox(height: 16),
      _buildColorRow('RGBA: ', rgbaColor),
      const SizedBox(height: 16),
      _buildColorRow('HSLA: ',
          'hsla(${hslColor.hue.round()}, ${hslColor.saturation.round()}%, ${hslColor.lightness.round()}%, ${(1.0 * color.alpha / 255).toStringAsFixed(2)})'),
      const SizedBox(height: 16),
      _buildColorRow('Type: ', type.toString().split('.').last),
    ];
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade400)),
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          if (mediaQueryWidth(context) > 500)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: color,
                        border: Border.all(color: Colors.grey.shade300)),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children2,
                )
              ],
            )
          else
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: color,
                        border: Border.all(color: Colors.grey.shade300)),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children2,
                )
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildColorRow(String label, value) {
    return Row(
      children: [
        Text(label),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

enum ColorType {
  Light,
  Dark,
}
