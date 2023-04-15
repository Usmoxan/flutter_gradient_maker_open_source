import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
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
  final ColorMode _mode = ColorMode.hex;
  final TextEditingController _hexController =
      TextEditingController(text: '#FFFFFFFF');
  final TextEditingController _rgbaController =
      TextEditingController(text: 'rgba(255, 255, 255, 1.00)');

  void _convertColor() {
    if (_mode == ColorMode.rgba) {
      setState(() {
        _hexController.text =
            '#${_color.value.toRadixString(16).padLeft(6, '0').toUpperCase()}';
        _rgbaController.text =
            'rgba(${_color.red}, ${_color.green}, ${_color.blue}, ${(_color.alpha / 255).toStringAsFixed(2)})';
      });
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Converter'),
      ),
      body: Center(
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
                        border: OutlineInputBorder(),
                        labelText: 'RGBA Value',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
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
    );
  }
}
