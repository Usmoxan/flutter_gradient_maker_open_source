import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gradient_maker/color_shade_generator/shade_color_picker.dart';
import 'package:meta_seo/meta_seo.dart';
import 'models/color_model.dart';

class ColorShadesScreen extends StatefulWidget {
  const ColorShadesScreen({super.key});

  @override
  _ColorShadesScreenState createState() => _ColorShadesScreenState();
}

class _ColorShadesScreenState extends State<ColorShadesScreen> {
  ColorModel _colorModel = ColorModel(color: const Color(0xff808080));

  void _onColorChanged(Color color) {
    setState(() {
      _colorModel = ColorModel(color: color);
    });
  }

  double mediaQueryWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

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
        title: const Text('Color Shades Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorPicker(onColorChanged: _onColorChanged),
            const SizedBox(height: 20),
            Text(
              'Shades of ${_colorModel.color.toString().toUpperCase()}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: GridView.builder(
              itemCount: _colorModel.shades.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: mediaQueryWidth(context) > 500 ? 5 : 3,
                // mainAxisSpacing: 10,
                // crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                final shade = _colorModel.shades[index];
                final hexColor =
                    '#${shade.value.toRadixString(16).substring(2)}';
                return GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: hexColor));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(milliseconds: 4000), // default 4s
                        content: Text('Copied!'),
                      ),
                    );
                  },
                  child: Container(
                    color: shade,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          hexColor,
                          style: const TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(3.0, 0.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${shade.red}, ${shade.green}, ${shade.blue}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(3.0, 0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
