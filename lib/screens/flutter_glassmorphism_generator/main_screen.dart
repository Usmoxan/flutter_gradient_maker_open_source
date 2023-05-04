import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../code_dialog.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../gradient_generator/widgets/color_picker_dialog.dart';

class GlassmorphismGenerator extends StatefulWidget {
  const GlassmorphismGenerator({super.key});

  @override
  State<GlassmorphismGenerator> createState() => _GlassmorphismGeneratorState();
}

class _GlassmorphismGeneratorState extends State<GlassmorphismGenerator> {
  String imageUrl = '';

  void _getRandomImage() {
    var random = Random();
    int index =
        random.nextInt(10) + 1; // generate a random number between 1 and 10
    String newImageUrl =
        'https://picsum.photos/300/300?random=$index'; // create a new random image URL
    setState(() {
      imageUrl = newImageUrl;
    });
  }

  bool isLight = false;
  double blurRadius = 3.0;
  double opacity = 0.3;
  final double minBlurRadius = 0.0;
  final double maxBlurRadius = 10.0;
  bool hasContent = true;
  bool hasBorder = true;
  Color mainColor = const Color(0xFF2196F3);
  var _colorNotifier;

  @override
  void initState() {
    Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        loopTime();
      },
    );

    super.initState();
  }

  void loopTime() {
    _colorNotifier = ValueNotifier<Color>(mainColor);
  }

  @override
  Widget build(BuildContext context) {
    _showBackgroundColorDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return ColorPickerDialog(
            colorNotifier: _colorNotifier,
            onColorChanged: (color) {
              setState(() {
                mainColor = color;
              });
            },
          );
        },
      );
    }

    // String code = '';
    // code += 'Container(';
    // code += 'decoration: BoxDecoration(';
    // code += 'color: ${_color.toString()},';
    // if (_hasShadow) {
    //   code += 'boxShadow: [';
    //   code += 'BoxShadow(';
    //   code += 'color: Colors.grey,';
    //   code += 'blurRadius: 5.0,';
    //   code += 'spreadRadius: 1.0,';
    //   code += 'offset: Offset(2.0, 2.0),';
    //   code += '),';
    //   code += '],';
    // }
    // code += 'border: Border.all(';
    // code += 'color: Colors.black,';
    // code += 'width: 1.0,';
    // code += 'style: BorderStyle.$_borderStyle,';
    // code += '),';
    // code +=
    //     'borderRadius: BorderRadius.circular(${_radius.toStringAsFixed(1)}),';
    // code += '),';
    // code += ')';
    // _outputController.text = code;
    // Clipboard.setData(ClipboardData(text: code));

    TextStyle titleStyle = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isLight ? Colors.white : Colors.black);
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: _showBackgroundColorDialog,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.shade300)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Glass Color",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: mainColor,
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(mainColor.toHex().toUpperCase())
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Text(
                              "Blur radius:",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Slider(
                                value: blurRadius.clamp(
                                    minBlurRadius, maxBlurRadius),
                                min: minBlurRadius,
                                max: maxBlurRadius,
                                onChanged: (v) {
                                  setState(() {
                                    blurRadius = v;
                                  });
                                }),
                            const Text(
                              "Opacity:",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Slider(
                                value: opacity,
                                onChanged: (v) {
                                  setState(() {
                                    opacity = v;
                                  });
                                }),
                            CheckboxListTile(
                              value: hasBorder,
                              onChanged: (v) {
                                setState(() {
                                  hasBorder = v!;
                                });
                              },
                              title: const Text('User border for glass:'),
                            ),
                            CheckboxListTile(
                              value: hasContent,
                              onChanged: (v) {
                                setState(() {
                                  hasContent = v!;
                                });
                              },
                              title: const Text('Show content on glass:'),
                            ),
                            SwitchListTile(
                              value: isLight,
                              onChanged: (v) {
                                setState(() {
                                  isLight = v;
                                });
                              },
                              title: const Text('Dark/Light'),
                            ),
                            ElevatedButton(
                                onPressed: _getRandomImage,
                                child: const Text('Random Background Image')),
                            const SizedBox(height: 10),
                            ElevatedButton(
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(
                                      text: generateGlassCode(
                                          blurRadius, opacity, mainColor)));
                                  CherryToast(
                                          icon: Icons.copy,
                                          themeColor: Colors.pink,
                                          title: const Text(""),
                                          displayTitle: false,
                                          description:
                                              const Text("Code copied"),
                                          toastPosition: Position.bottom,
                                          animationDuration: const Duration(
                                              milliseconds: 1000),
                                          autoDismiss: true)
                                      .show(context);
                                },
                                child: const Text('Copy Code'))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              width: 466,
                              height: 468,
                              child: Stack(
                                children: [
                                  imageUrl.isNotEmpty
                                      ? Image.network(
                                          width: double.infinity,
                                          height: double.infinity,
                                          imageUrl,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          width: double.infinity,
                                          height: double.infinity,
                                          'https://picsum.photos/300/300?random=',
                                          fit: BoxFit.cover,
                                        ),
                                  Center(
                                    child: ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: blurRadius,
                                            sigmaY: blurRadius),
                                        child: Container(
                                          width: 336,
                                          height: 338,
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: hasBorder
                                                      ? mainColor
                                                      : Colors.transparent,
                                                  width: .8),
                                              color: mainColor
                                                  .withOpacity(opacity),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: hasContent
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "User List",
                                                            style: titleStyle,
                                                          ),
                                                        ),
                                                        Icon(Icons.settings,
                                                            color: isLight
                                                                ? Colors.white
                                                                : Colors.black)
                                                      ],
                                                    ),
                                                    const Divider(
                                                      thickness: .2,
                                                    ),
                                                    ListItemPreview(
                                                      borderColor: mainColor,
                                                      isLight: isLight,
                                                    ),
                                                    const Divider(
                                                      thickness: .2,
                                                    ),
                                                    ListItemPreview(
                                                      borderColor: mainColor,
                                                      isLight: isLight,
                                                    ),
                                                    const Divider(
                                                      thickness: .2,
                                                    ),
                                                    ListItemPreview(
                                                      borderColor: mainColor,
                                                      isLight: isLight,
                                                    ),
                                                  ],
                                                )
                                              : Container(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CodeViewerDialog(
                  code: generateGlassCode(blurRadius, opacity, mainColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListItemPreview extends StatelessWidget {
  final bool isLight;
  final Color borderColor;
  const ListItemPreview({
    super.key,
    required this.isLight,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isLight ? Colors.white : Colors.black);
    TextStyle subTitleStyle = TextStyle(
        color: isLight
            ? Colors.white.withOpacity(.7)
            : Colors.black.withOpacity(.7));
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: borderColor)),
        child: ClipOval(
          child: Image.network(
            "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        "John Doe",
        style: titleStyle,
      ),
      subtitle: Text(
        'UI/UX designer',
        style: subTitleStyle,
      ),
      trailing:
          Icon(Icons.more_vert, color: isLight ? Colors.white : Colors.black),
    );
  }
}

extension ColorExtension on Color {
  String toHex() {
    return '#${value.toRadixString(16).substring(2).toUpperCase()}';
  }
}
