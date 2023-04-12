import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:icons_plus/icons_plus.dart';

class ColorPickerDialog extends StatelessWidget {
  final ValueNotifier<Color> colorNotifier;
  final Function(Color) onColorChanged;

  const ColorPickerDialog({
    super.key,
    required this.colorNotifier,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 500,
        width: 1000,
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(IonIcons.close),
                ),
              ),
              SingleChildScrollView(
                child: ValueListenableBuilder<Color>(
                  valueListenable: colorNotifier,
                  builder: (_, color, __) {
                    return ColorPicker(
                      color: color,
                      onChanged: (value) {
                        onColorChanged(value);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
