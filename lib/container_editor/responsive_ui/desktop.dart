import 'dart:async';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../gradient_generator/widgets/color_picker_dialog.dart';
import '../utils/strings.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({super.key});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  //styles
  final titleStyle = const TextStyle(fontSize: 20);
  //double
  double opacityValue = 1;
  double borderAllRadius = 0;
  double borderSize = 1;
  //bools
  bool borderSwitch = false;
  bool shadowSwitch = false;
  //colors
  Color mainContainerColor = const Color(0xFF2196F3);
  Color mainContainerBorderColor = const Color(0xFF707070);
  Color mainContainerShadowColor = const Color(0xFF9E9E9E);
  //Notifier
  var _colorNotifier;
  var _colorNotifier2;
  var _colorNotifier3;
  //int
  int selected = 0;
  //Controllers
  final _allBorderRadius = TextEditingController(text: '0');
  final _borderSize = TextEditingController(text: '1');
  //BorderAlign
  var borderAlign = BorderSide.strokeAlignCenter;
  var borderAlignStr = "BorderSide.strokeAlignCenter";
  //
  String dropdownValue = 'Center';

  List<String> spinnerItems = ['Center', 'Inside', 'Outside'];

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
    _colorNotifier = ValueNotifier<Color>(mainContainerColor);
    _colorNotifier2 = ValueNotifier<Color>(mainContainerBorderColor);
    _colorNotifier3 = ValueNotifier<Color>(mainContainerShadowColor);
  }

  void _onColorChanged(Color color) {
    setState(() {
      mainContainerColor = color;
      mainContainerBorderColor = color;
      mainContainerShadowColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Container Editor'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(
              text: generateContainerColor(
                  opacityValue,
                  borderAllRadius,
                  borderSize,
                  borderSwitch,
                  mainContainerColor,
                  mainContainerBorderColor,
                  borderAlignStr,
                  shadowSwitch,
                  mainContainerShadowColor)));
          CherryToast(
                  icon: Icons.copy,
                  themeColor: Colors.pink,
                  title: const Text(""),
                  displayTitle: false,
                  description: const Text("Code copied"),
                  toastPosition: Position.bottom,
                  animationDuration: const Duration(milliseconds: 1000),
                  autoDismiss: true)
              .show(context);
        },
        child: const Icon(Icons.copy),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xffE4E4E4),
              child: Center(
                child: Opacity(
                  opacity: opacityValue,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                        border: borderSwitch
                            ? Border.all(
                                color: mainContainerBorderColor,
                                width: borderSize,
                                strokeAlign: borderAlign,
                              )
                            : null,
                        boxShadow: shadowSwitch
                            ? [
                                BoxShadow(
                                  blurRadius: 1.5,
                                  blurStyle: BlurStyle.normal,
                                  color: mainContainerShadowColor,
                                  offset: const Offset(1.5, 2.5),
                                  spreadRadius: 5,
                                )
                              ]
                            : null,
                        color: mainContainerColor,
                        borderRadius: BorderRadius.circular(borderAllRadius)),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Color",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          heightBox(),
                          GestureDetector(
                            onTap: _showBackgroundColorDialog,
                            child: Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  color: mainContainerColor,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          heightBox(),
                          const Divider(thickness: .5),
                          heightBox(),
                          const Text(
                            "Radius",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          heightBox(),
                          SegmentedButton(
                            segments: const [
                              ButtonSegment(
                                  value: 0,
                                  label: Text('All'),
                                  icon: Icon(BoxIcons.bx_square_rounded)),
                              ButtonSegment(
                                  value: 1,
                                  label: Text('Only'),
                                  icon: Icon(IonIcons.scan_sharp)),
                            ],
                            selected: <int>{selected},
                            onSelectionChanged: (newSelection) {
                              setState(() {
                                selected = newSelection.first;
                              });
                            },
                          ),
                          if (selected == 0)
                            SizedBox(
                                width: 100,
                                child: TextField(
                                  controller: _allBorderRadius,
                                  onSubmitted: (value) {
                                    setState(() {
                                      borderAllRadius = double.parse(value);
                                    });
                                  },
                                )),
                          heightBox(),
                          const Divider(thickness: .5),
                          heightBox(),
                          const Text(
                            "Opacity",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          heightBox(),
                          Slider(
                              value: opacityValue,
                              onChanged: (v) {
                                setState(() {
                                  opacityValue = v;
                                });
                              }),
                          heightBox(),
                          const Divider(thickness: .5),
                          heightBox(),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "Border",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Switch(
                                  value: borderSwitch,
                                  onChanged: (v) {
                                    setState(() {
                                      borderSwitch = v;
                                    });
                                  })
                            ],
                          ),
                          heightBox(),
                          if (borderSwitch)
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Color",
                                        style: titleStyle,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: _showBorderColorDialog,
                                      child: Container(
                                        width: 80,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            color: mainContainerBorderColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ],
                                ),
                                heightBox(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Size",
                                        style: titleStyle,
                                      ),
                                    ),
                                    SizedBox(
                                        width: 100,
                                        child: TextField(
                                          controller: _borderSize,
                                          onSubmitted: (value) {
                                            setState(() {
                                              borderSize = double.parse(value);
                                            });
                                          },
                                        ))
                                  ],
                                ),
                                heightBox(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Stroke align",
                                        style: titleStyle,
                                      ),
                                    ),
                                    DropdownButton<String>(
                                      dropdownColor: const Color(0xffF8F9FB),
                                      value: dropdownValue,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      underline: Container(height: 0),
                                      onChanged: (data) {
                                        setState(() {
                                          dropdownValue = data!;
                                          if (data == 'Center') {
                                            setState(() {
                                              borderAlign =
                                                  BorderSide.strokeAlignCenter;
                                              borderAlignStr =
                                                  "BorderSide.strokeAlignCenter";
                                            });
                                          }
                                          if (data == 'Inside') {
                                            setState(() {
                                              borderAlign =
                                                  BorderSide.strokeAlignInside;
                                              borderAlignStr =
                                                  "BorderSide.strokeAlignInside";
                                            });
                                          }
                                          if (data == 'Outside') {
                                            setState(() {
                                              borderAlign =
                                                  BorderSide.strokeAlignOutside;
                                              borderAlignStr =
                                                  "BorderSide.strokeAlignOutside";
                                            });
                                          }
                                        });
                                      },
                                      items: spinnerItems
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          heightBox(),
                          const Divider(thickness: .5),
                          heightBox(),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "Shadow",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Switch(
                                  value: shadowSwitch,
                                  onChanged: (v) {
                                    setState(() {
                                      shadowSwitch = v;
                                    });
                                  })
                            ],
                          ),
                          heightBox(),
                          if (shadowSwitch)
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Color",
                                    style: titleStyle,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: _showShadowColorDialog,
                                  child: Container(
                                    width: 80,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                        color: mainContainerShadowColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox heightBox() {
    return const SizedBox(height: 10);
  }

  _showBackgroundColorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return ColorPickerDialog(
          colorNotifier: _colorNotifier,
          onColorChanged: (color) {
            setState(() {
              mainContainerColor = color;
            });
          },
        );
      },
    );
  }

  _showBorderColorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return ColorPickerDialog(
          colorNotifier: _colorNotifier2,
          onColorChanged: (color) {
            setState(() {
              mainContainerBorderColor = color;
            });
          },
        );
      },
    );
  }

  _showShadowColorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return ColorPickerDialog(
          colorNotifier: _colorNotifier3,
          onColorChanged: (color) {
            setState(() {
              mainContainerShadowColor = color;
            });
          },
        );
      },
    );
  }
}
