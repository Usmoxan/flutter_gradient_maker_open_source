// ignore_for_file: library_private_types_in_public_api

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';
import 'color_details_card.dart';

class HEXtoRGBA extends StatefulWidget {
  const HEXtoRGBA({super.key});

  @override
  _HEXtoRGBAState createState() => _HEXtoRGBAState();
}

enum ColorMode {
  rgba,
  hex,
}

class _HEXtoRGBAState extends State<HEXtoRGBA> {
  double mediaQueryWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  Color _color = Colors.white;
  ColorMode _mode = ColorMode.hex;
  final TextEditingController _hexController =
      TextEditingController(text: '#FFFFFFFF');
  final TextEditingController _rgbaController =
      TextEditingController(text: 'rgba(255, 255, 255, 1.00)');

  void _convertColor() {
    if (_mode == ColorMode.rgba) {
      final rgbaValue = _rgbaController.text;
      final regex = RegExp(r'rgba\((\d+), (\d+), (\d+), (\d+\.\d+)\)');
      final match = regex.firstMatch(rgbaValue);

      if (match != null) {
        final red = int.parse(match.group(1)!);
        final green = int.parse(match.group(2)!);
        final blue = int.parse(match.group(3)!);
        final alpha = double.parse(match.group(4)!);

        setState(() {
          _color = Color.fromRGBO(red, green, blue, alpha);
          _hexController.text =
              '#${_color.value.toRadixString(16).padLeft(6, '0').toUpperCase()}';
        });
      } else {
        CherryToast(
                icon: Icons.close,
                iconColor: Colors.red,
                themeColor: Colors.pink,
                title: const Text(""),
                displayTitle: false,
                description: const Text("Please enter a valid HEX code"),
                toastPosition: Position.bottom,
                animationDuration: const Duration(milliseconds: 1000),
                autoDismiss: true)
            .show(context);
      }
    } else {
      final isValidHexColor = RegExp(r'^#FF?([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$')
          .hasMatch(_hexController.text);
      if (isValidHexColor) {
        setState(() {
          _color = Color(
              int.parse(_hexController.text.replaceAll('#', ''), radix: 16));
          _rgbaController.text =
              'rgba(${_color.red}, ${_color.green}, ${_color.blue}, ${(_color.alpha / 255).toStringAsFixed(2)})';
        });
      } else {
        CherryToast(
                icon: Icons.close,
                iconColor: Colors.red,
                themeColor: Colors.pink,
                title: const Text(""),
                displayTitle: false,
                description: const Text("Please enter a valid HEX code"),
                toastPosition: Position.bottom,
                animationDuration: const Duration(milliseconds: 1000),
                autoDismiss: true)
            .show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // add meta seo data for web app as you want
      meta.author(author: 'Usmoxan');
      meta.description(
          description:
              'Gradient maker app for Flutter and Container editor, Color shade Generator, HEX to RGBA converter. The app is not fully finished Flutter little tools for you please use for free.');
      meta.keywords(
          keywords:
              'Flutter, Dart, Flutter Gradient, Gradient Maker Flutter, Web');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Converter'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (mediaQueryWidth(context) > 500)
                SizedBox(
                  width: 800,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _hexController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'HEX Value',
                            hintText: 'Example: #FFFFFFFF)',
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: _convertColor,
                        child: Container(
                          width: 100,
                          height: 50,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Convert",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextField(
                          controller: _rgbaController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'RGBA Value',
                            hintText: 'Example: rgba(255, 255, 255, 1.00)',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                )
              else
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: _hexController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Example: #FFFFFFFF)',
                          labelText: 'HEX Value',
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: _convertColor,
                      child: Container(
                        width: 100,
                        height: 50,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            "Convert",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: _rgbaController,
                        decoration: const InputDecoration(
                          hintText: 'Example: rgba(255, 255, 255, 1.00)',
                          border: OutlineInputBorder(),
                          labelText: 'RGBA Value',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio<ColorMode>(
                      value: ColorMode.hex,
                      groupValue: _mode,
                      onChanged: (value) {
                        setState(() {
                          _mode = value!;
                        });
                      },
                    ),
                    const Text('HEX to RGBA'),
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: 30,
                      width: 2,
                      color: Colors.grey,
                    ),
                    Radio<ColorMode>(
                      value: ColorMode.rgba,
                      groupValue: _mode,
                      onChanged: (value) {
                        setState(() {
                          _mode = value!;
                        });
                      },
                    ),
                    const Text('RGBA to HEX'),
                  ],
                ),
              ),
              SizedBox(
                width: mediaQueryWidth(context) > 500 ? 800 : 300,
                child: ColorDetails(
                  color: _color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
