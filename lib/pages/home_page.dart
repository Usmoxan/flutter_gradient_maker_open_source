import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:icons_plus/icons_plus.dart';
import '../widgets/button_selector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Alignment
  Alignment begin = Alignment.bottomRight;
  Alignment end = Alignment.topLeft;

  //colors
  final Color selectedColor = const Color(0xFFDEEBFF);
  Color _color1 = Colors.red;
  Color _color2 = Colors.green;
  int _choice = 1;
  //Colors Grids
  Color gridItem1 = const Color(0xFFDEEBFF);
  Color gridItem2 = Colors.white;
  Color gridItem3 = Colors.white;
  Color gridItem4 = Colors.white;
  Color gridItem5 = Colors.white;
  Color gridItem6 = Colors.white;
  Color gridItem7 = Colors.white;
  Color gridItem8 = Colors.white;
  Color gridItem9 = Colors.white;

  void funcChoice(int choice, Color selectedColor) {
    switch (choice) {
      case 1:
        {
          setState(() {
            gridItem1 = selectedColor;
            gridItem2 = Colors.white;
            gridItem3 = Colors.white;
            gridItem4 = Colors.white;
            gridItem5 = Colors.white;
            gridItem6 = Colors.white;
            gridItem7 = Colors.white;
            gridItem8 = Colors.white;
            gridItem9 = Colors.white;
            begin = Alignment.bottomRight;
            end = Alignment.topLeft;
          });
        }

        break;
      case 2:
        {
          setState(() {
            gridItem2 = selectedColor;
            gridItem1 = Colors.white;
            gridItem3 = Colors.white;
            gridItem4 = Colors.white;
            gridItem5 = Colors.white;
            gridItem6 = Colors.white;
            gridItem7 = Colors.white;
            gridItem8 = Colors.white;
            gridItem9 = Colors.white;
            begin = Alignment.bottomCenter;
            end = Alignment.topCenter;
          });
        }

        break;
      case 3:
        {
          setState(() {
            gridItem3 = selectedColor;
            gridItem2 = Colors.white;
            gridItem1 = Colors.white;
            gridItem4 = Colors.white;
            gridItem5 = Colors.white;
            gridItem6 = Colors.white;
            gridItem7 = Colors.white;
            gridItem8 = Colors.white;
            gridItem9 = Colors.white;
            begin = Alignment.bottomLeft;
            end = Alignment.topRight;
          });
        }

        break;
      case 4:
        {
          setState(() {
            gridItem4 = selectedColor;
            gridItem2 = Colors.white;
            gridItem3 = Colors.white;
            gridItem1 = Colors.white;
            gridItem5 = Colors.white;
            gridItem6 = Colors.white;
            gridItem7 = Colors.white;
            gridItem8 = Colors.white;
            gridItem9 = Colors.white;
            begin = Alignment.centerRight;
            end = Alignment.centerLeft;
          });
        }

        break;
      case 5:
        {
          setState(() {
            gridItem5 = selectedColor;
            gridItem2 = Colors.white;
            gridItem3 = Colors.white;
            gridItem4 = Colors.white;
            gridItem1 = Colors.white;
            gridItem6 = Colors.white;
            gridItem7 = Colors.white;
            gridItem8 = Colors.white;
            gridItem9 = Colors.white;
            begin = Alignment.center;
            end = Alignment.center;
          });
        }

        break;
      case 6:
        {
          setState(() {
            gridItem6 = selectedColor;
            gridItem2 = Colors.white;
            gridItem3 = Colors.white;
            gridItem4 = Colors.white;
            gridItem5 = Colors.white;
            gridItem1 = Colors.white;
            gridItem7 = Colors.white;
            gridItem8 = Colors.white;
            gridItem9 = Colors.white;
            begin = Alignment.centerLeft;
            end = Alignment.centerRight;
          });
        }

        break;
      case 7:
        {
          setState(() {
            gridItem7 = selectedColor;
            gridItem2 = Colors.white;
            gridItem3 = Colors.white;
            gridItem4 = Colors.white;
            gridItem5 = Colors.white;
            gridItem6 = Colors.white;
            gridItem1 = Colors.white;
            gridItem8 = Colors.white;
            gridItem9 = Colors.white;
            begin = Alignment.topRight;
            end = Alignment.bottomLeft;
          });
        }

        break;
      case 8:
        {
          setState(() {
            gridItem8 = selectedColor;
            gridItem2 = Colors.white;
            gridItem3 = Colors.white;
            gridItem4 = Colors.white;
            gridItem5 = Colors.white;
            gridItem6 = Colors.white;
            gridItem7 = Colors.white;
            gridItem1 = Colors.white;
            gridItem9 = Colors.white;
            begin = Alignment.topCenter;
            end = Alignment.bottomCenter;
          });
        }

        break;
      case 9:
        {
          setState(() {
            gridItem9 = selectedColor;
            gridItem2 = Colors.white;
            gridItem3 = Colors.white;
            gridItem4 = Colors.white;
            gridItem5 = Colors.white;
            gridItem6 = Colors.white;
            gridItem7 = Colors.white;
            gridItem8 = Colors.white;
            gridItem1 = Colors.white;
            begin = Alignment.topLeft;
            end = Alignment.bottomRight;
          });
        }

        break;
      default:
    }
  }

  //colors
  var _colorNotifier;
  var _colorNotifier2;

  final Color _selectedColor = const Color(0xFFDEEBFF);

  //bools
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
    return Scaffold(
      body: Row(
        children: [
          ///
          Container(
            padding: const EdgeInsets.all(50),
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  "Flutter\nGradient\nGenerator Pro".toUpperCase(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Style",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: isLinearStyle
                                ? MaterialStatePropertyAll(_selectedColor)
                                : const MaterialStatePropertyAll(Colors.white)),
                        onPressed: () {
                          setState(() {
                            isLinearStyle = true;
                          });
                        },
                        child: const Text(
                          "Linear",
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(width: 10),
                    OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: isLinearStyle
                                ? const MaterialStatePropertyAll(Colors.white)
                                : MaterialStatePropertyAll(_selectedColor)),
                        onPressed: () {
                          setState(() {
                            isLinearStyle = false;
                          });
                        },
                        child: const Text(
                          "Radial",
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Direction",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    //TOP
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButtonSelection(
                            icon: Bootstrap.arrow_up_left,
                            onPressed: () {
                              setState(() {
                                _choice = 1;
                                funcChoice(_choice, selectedColor);
                              });
                            },
                            bgColor: gridItem1,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: OutlinedButtonSelection(
                            onPressed: () {
                              setState(() {
                                _choice = 2;
                                funcChoice(_choice, selectedColor);
                              });
                            },
                            icon: Bootstrap.arrow_up,
                            bgColor: gridItem2,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: OutlinedButtonSelection(
                            onPressed: () {
                              setState(() {
                                _choice = 3;
                                funcChoice(_choice, selectedColor);
                              });
                            },
                            icon: Bootstrap.arrow_up_right,
                            bgColor: gridItem3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //CENTER
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButtonSelection(
                            icon: Bootstrap.arrow_left,
                            onPressed: () {
                              setState(() {
                                _choice = 4;
                                funcChoice(_choice, selectedColor);
                              });
                            },
                            bgColor: gridItem4,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: isLinearStyle
                              ? Container()
                              : OutlinedButtonSelection(
                                  onPressed: () {
                                    setState(() {
                                      _choice = 5;
                                      funcChoice(_choice, selectedColor);
                                    });
                                  },
                                  icon: Bootstrap.circle10,
                                  bgColor: gridItem5,
                                ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: OutlinedButtonSelection(
                            onPressed: () {
                              setState(() {
                                _choice = 6;
                                funcChoice(_choice, selectedColor);
                                print(_choice);
                              });
                            },
                            icon: Bootstrap.arrow_right,
                            bgColor: gridItem6,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //BOTTOM
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButtonSelection(
                            icon: Bootstrap.arrow_down_left,
                            onPressed: () {
                              setState(() {
                                _choice = 7;
                                funcChoice(_choice, selectedColor);
                                print(_choice);
                              });
                            },
                            bgColor: gridItem7,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: OutlinedButtonSelection(
                            onPressed: () {
                              setState(() {
                                _choice = 8;
                                funcChoice(_choice, selectedColor);
                                print(_choice);
                              });
                            },
                            icon: Bootstrap.arrow_down,
                            bgColor: gridItem8,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: OutlinedButtonSelection(
                            onPressed: () {
                              setState(() {
                                _choice = 9;
                                funcChoice(_choice, selectedColor);
                                print(_choice);
                              });
                            },
                            icon: Bootstrap.arrow_down_right,
                            bgColor: gridItem9,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: const [
                      Text(
                        "Color & Stops",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _showDialog1,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: _color1,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: _showDialog2,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: _color2,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                          onPressed: _changeColor,
                          child: const Text(
                            "Random",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (isLinearStyle) {
                                Clipboard.setData(ClipboardData(text: """
  LinearGradient(
              colors: [
                          $_color1,
                          $_color2,
                        ],
                        begin: $begin,
                        end: $end,
              )"""));
                              } else {
                                Clipboard.setData(ClipboardData(text: """
 RadialGradient(colors: [
                        $_color1,
                        $_color2,
                      ], stops: const [
                        0,
                        1
                      ], center: $begin, radius: 0.8),"""));
                              }
                            },
                            child: const Text("Copy Gradient Code")),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Center(
                  child: Text("Created by Hayrulloh"),
                )
              ],
            ),
          ),

          ///
          ///
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: isLinearStyle
                    ? LinearGradient(
                        colors: [
                          _color1,
                          _color2,
                        ],
                        begin: begin,
                        end: end,
                      )
                    : RadialGradient(colors: [
                        _color1,
                        _color2,
                      ], stops: const [
                        0,
                        1
                      ], center: begin, radius: 0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _changeColor() {
    setState(() {
      _color1 = Color(Random().nextInt(0xffffffff));
      _color2 = Color(Random().nextInt(0xffffffff));
    });
  }

  _showDialog1() {
    return showDialog(
        context: context,
        builder: (context) {
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
                        valueListenable: _colorNotifier,
                        builder: (_, color, __) {
                          return ColorPicker(
                            color: color,
                            onChanged: (value) {
                              setState(() {
                                color = value;
                                _color1 = value;
                              });
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
        });
  }

  _showDialog2() {
    return showDialog(
        context: context,
        builder: (context) {
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
                        valueListenable: _colorNotifier2,
                        builder: (_, color, __) {
                          return ColorPicker(
                              color: color,
                              onChanged: (value) {
                                setState(() {
                                  color = value;
                                  _color2 = value;
                                });
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
