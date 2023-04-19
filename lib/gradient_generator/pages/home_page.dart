// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:async';
import 'dart:math';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gradient_maker/gradient_generator/pages/mobile_gradient_container.dart';
import 'package:flutter_gradient_maker/gradient_generator/utils/colors.dart';
import 'package:flutter_gradient_maker/gradient_generator/utils/strings.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:meta_seo/meta_seo.dart';
import '../../color_shade_generator/shade_generator_main.dart';
import '../../container_editor/main_page.dart';
import '../../hex_to_rgba/main_page.dart';
import '../widgets/color_picker_button.dart';
import '../widgets/color_picker_dialog.dart';
import '../widgets/style_selector_row.dart';
import 'direction_grid.dart';
import 'gradient_container.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  //Alignments
  Alignment begin = Alignment.bottomRight;
  Alignment end = Alignment.topLeft;

  //Styles
  TextStyle widgetsTitle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  //Colors
  final Color selectedColor = const Color(0xFFDEEBFF);
  Color _color1 = Color(Random().nextInt(0xffffffff));
  Color _color2 = Color(Random().nextInt(0xffffffff));
  //Notifier

  var _colorNotifier;
  var _colorNotifier2;

  final Color _selectedColor = const Color(0xFFDEEBFF);

  //Colors Grids
  Color gridItem1 = const Color(0xFFDEEBFF);
  Color gridItem2 = white;
  Color gridItem3 = white;
  Color gridItem4 = white;
  Color gridItem5 = white;
  Color gridItem6 = white;
  Color gridItem7 = white;
  Color gridItem8 = white;
  Color gridItem9 = white;

  //TextEditingController
  final firstColorEditingController = TextEditingController(text: '0');
  final secondColorEditingController = TextEditingController(text: '100');

  //INFO: Choice Function
  void funcChoice(int choice, Color selectedColor) {
    List<Color> gridColors = List.filled(9, white);
    List<Alignment> gridAlignments = [
      Alignment.bottomRight,
      Alignment.bottomCenter,
      Alignment.bottomLeft,
      Alignment.centerRight,
      Alignment.center,
      Alignment.centerLeft,
      Alignment.topRight,
      Alignment.topCenter,
      Alignment.topLeft,
    ];

    gridColors[choice - 1] = selectedColor;
    begin = gridAlignments[choice - 1];
    end = begin * -1.0;
    setState(() {
      gridItem1 = gridColors[0];
      gridItem2 = gridColors[1];
      gridItem3 = gridColors[2];
      gridItem4 = gridColors[3];
      gridItem5 = gridColors[4];
      gridItem6 = gridColors[5];
      gridItem7 = gridColors[6];
      gridItem8 = gridColors[7];
      gridItem9 = gridColors[8];
    });
  }

  //Bools
  bool isLinearStyle = true;

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
    _colorNotifier = ValueNotifier<Color>(_color1);
    _colorNotifier2 = ValueNotifier<Color>(_color2);
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
    String linearCode = generateLinearCode(_color1, _color2, begin, end);
    String radialCode = generateRadialCode(_color1, _color2, begin);
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: SizedBox(
                width: 350,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.all(mediaQueryWidth(context) > 500 ? 50 : 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mediaQueryWidth(context) > 500
                            ? Text(
                                "Flutter\nGradient\nGenerator Pro"
                                    .toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            : MobileGradientContainer(
                                isLinearStyle: isLinearStyle,
                                color1: _color1,
                                color2: _color2,
                                begin: begin,
                                end: end),
                        SizedBox(
                            height: mediaQueryWidth(context) > 500 ? 40 : 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text("Style", style: widgetsTitle),
                        ),
                        Visibility(
                            visible:
                                mediaQueryWidth(context) > 500 ? true : false,
                            child: const SizedBox(height: 10)),
                        StyleSelectorRow(
                          isLinearStyle: isLinearStyle,
                          selectedColor: _selectedColor,
                          onLinearPressed: () {
                            setState(() {
                              isLinearStyle = true;
                            });
                          },
                          onRadialPressed: () {
                            setState(() {
                              isLinearStyle = false;
                            });
                          },
                        ),
                        heightSpaceSize(),
                        Text("Direction", style: widgetsTitle),
                        heightSpaceSize(),
                        ToolsPanel(
                            funcChoice: funcChoice,
                            gridItem1: gridItem1,
                            gridItem2: gridItem2,
                            gridItem3: gridItem3,
                            gridItem4: gridItem4,
                            gridItem5: gridItem5,
                            gridItem6: gridItem6,
                            gridItem7: gridItem7,
                            gridItem8: gridItem8,
                            gridItem9: gridItem9,
                            isLinearStyle: isLinearStyle,
                            selectedColor: selectedColor),
                        heightSpaceSize(),
                        Padding(
                          padding: mediaQueryWidth(context) > 500
                              ? const EdgeInsets.only(top: 10, bottom: 10)
                              : const EdgeInsets.all(0),
                          child: Row(
                            children: [
                              Text(
                                "Color & Stops",
                                style: widgetsTitle,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        heightSpaceSize(),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: _showDialog1,
                                child: ColorPickerButton(
                                  color: _color1,
                                ),
                              ),
                            ),
                            widthSpaceSize(),
                            Expanded(
                              child: GestureDetector(
                                onTap: _showDialog2,
                                child: ColorPickerButton(
                                  color: _color2,
                                ),
                              ),
                            ),
                            widthSpaceSize(),
                            OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _color1 =
                                        Color(Random().nextInt(0xffffffff));
                                    _color2 =
                                        Color(Random().nextInt(0xffffffff));
                                  });
                                },
                                child: const Text(
                                  "Random",
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ),
                        heightSpaceSize(),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(
                                    text: isLinearStyle
                                        ? linearCode
                                        : radialCode));

                                CherryToast(
                                        icon: Icons.copy,
                                        themeColor: Colors.pink,
                                        title: const Text(""),
                                        displayTitle: false,
                                        description: const Text(copiedText),
                                        toastPosition: Position.bottom,
                                        animationDuration:
                                            const Duration(milliseconds: 1000),
                                        autoDismiss: true)
                                    .show(context);
                              },
                              child: const Text(copyText)),
                        ),
                        heightSpaceSize(),
                        Padding(
                          padding: mediaQueryWidth(context) > 500
                              ? const EdgeInsets.only(top: 10, bottom: 10)
                              : const EdgeInsets.all(0),
                          child: Row(
                            children: [
                              Text(
                                "Other features",
                                style: widgetsTitle,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        heightSpaceSize(),
                        badgeButton(
                          color1: Colors.red,
                          color2: Colors.amber,
                          type: "BETA",
                          text: "Color Shade Generator",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ColorShadesScreen(),
                                ));
                          },
                        ),
                        heightSpaceSize(),
                        badgeButton(
                          color1: Colors.blue,
                          color2: Colors.green,
                          type: "NEW",
                          text: "HEX to RGBA",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HEXtoRGBA(),
                                ));
                          },
                        ),
                        heightSpaceSize(),
                        badgeButton(
                          color1: Colors.red,
                          color2: Colors.amber,
                          type: "BETA",
                          text: "Container Editor",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ContainerEditor(),
                                ));
                          },
                        ),
                        heightSpaceSize(),
                        const Center(
                          child: Text(creatorName),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (mediaQueryWidth(context) > 500)
              GradientContainer(
                color1: _color1,
                color2: _color2,
                isLinearStyle: isLinearStyle,
                begin: begin,
                end: end,
              ),
          ],
        ),
      ),
    );
  }

  double mediaQueryWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  SizedBox heightSpaceSize() => const SizedBox(height: 10);

  SizedBox widthSpaceSize() => const SizedBox(width: 10);

  _showDialog1() {
    showDialog(
      context: context,
      builder: (context) {
        return ColorPickerDialog(
          colorNotifier: _colorNotifier,
          onColorChanged: (color) {
            setState(() {
              _color1 = color;
            });
          },
        );
      },
    );
  }

  _showDialog2() {
    showDialog(
      context: context,
      builder: (context) {
        return ColorPickerDialog(
          colorNotifier: _colorNotifier2,
          onColorChanged: (color) {
            setState(() {
              _color2 = color;
            });
          },
        );
      },
    );
  }
}

class badgeButton extends StatelessWidget {
  final String text;
  final String type;
  final Color color1;
  final Color color2;
  final VoidCallback onPressed;
  const badgeButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.type,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeStyle: badges.BadgeStyle(
        borderSide: const BorderSide(color: Colors.white, width: 1),
        // shape: badges.BadgeShape.triangle,
        badgeGradient: badges.BadgeGradient.linear(
          colors: [
            color1,
            color2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      badgeAnimation: const badges.BadgeAnimation.fade(
        animationDuration: Duration(seconds: 1),
        loopAnimation: false,
      ),
      ignorePointer: false,
      badgeContent: Text(
        type,
        style: const TextStyle(color: Colors.white, fontSize: 8),
      ),
      position: badges.BadgePosition.topEnd(top: -12),
      child: OutlinedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color: Colors.black),
          )),
    );
  }
}
