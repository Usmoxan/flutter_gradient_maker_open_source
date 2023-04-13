import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../widgets/button_selector.dart';

class ToolsPanel extends StatelessWidget {
  final bool isLinearStyle;
  final Color selectedColor;
  final Function funcChoice;
  final Color gridItem1;
  final Color gridItem2;
  final Color gridItem3;
  final Color gridItem4;
  final Color gridItem5;
  final Color gridItem6;
  final Color gridItem7;
  final Color gridItem8;
  final Color gridItem9;

  const ToolsPanel({
    Key? key,
    required this.isLinearStyle,
    required this.selectedColor,
    required this.funcChoice,
    required this.gridItem1,
    required this.gridItem2,
    required this.gridItem3,
    required this.gridItem4,
    required this.gridItem5,
    required this.gridItem6,
    required this.gridItem7,
    required this.gridItem8,
    required this.gridItem9,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TOP
        Row(
          children: [
            Expanded(
              child: OutlinedButtonSelection(
                icon: Bootstrap.arrow_up_left,
                onPressed: () {
                  funcChoice(1, selectedColor);
                },
                bgColor: gridItem1,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: OutlinedButtonSelection(
                onPressed: () {
                  funcChoice(2, selectedColor);
                },
                icon: Bootstrap.arrow_up,
                bgColor: gridItem2,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: OutlinedButtonSelection(
                onPressed: () {
                  funcChoice(3, selectedColor);
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
                  funcChoice(4, selectedColor);
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
                        funcChoice(5, selectedColor);
                      },
                      icon: Bootstrap.circle10,
                      bgColor: gridItem5,
                    ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: OutlinedButtonSelection(
                onPressed: () {
                  funcChoice(6, selectedColor);
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
                  funcChoice(7, selectedColor);
                },
                bgColor: gridItem7,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: OutlinedButtonSelection(
                onPressed: () {
                  funcChoice(8, selectedColor);
                },
                icon: Bootstrap.arrow_down,
                bgColor: gridItem8,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: OutlinedButtonSelection(
                onPressed: () {
                  funcChoice(9, selectedColor);
                },
                icon: Bootstrap.arrow_down_right,
                bgColor: gridItem9,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
