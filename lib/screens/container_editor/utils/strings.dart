import 'package:flutter/material.dart';

String generateContainerColor(
    double opacityValue,
    double radius,
    double borderSize,
    bool borderSwitch,
    Color color,
    Color borderColor,
    var borderAlign,
    bool shadowSwitch,
    Color mainContainerShadowColor) {
  return borderSwitch
      ? """
Opacity(
  opacity: $opacityValue,
  child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                border: Border.all(
                            color: $borderColor,
                            width: $borderSize,
                            strokeAlign: $borderAlign),
              ${shadowSwitch ? """boxShadow:  [
                                BoxShadow(
                                  blurRadius: 1.5,
                                  blurStyle: BlurStyle.normal,
                                  color: $mainContainerShadowColor,
                                  offset: const Offset(1.5, 2.5),
                                  spreadRadius: 5,
                                )
                              ],""" : ""}
                color: $color,
                borderRadius: BorderRadius.circular($radius)),
      ),
)
"""
      : """
Opacity(
  opacity: $opacityValue,
  child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                   ${shadowSwitch ? """boxShadow:  [
                                BoxShadow(
                                  blurRadius: 1.5,
                                  blurStyle: BlurStyle.normal,
                                  color: $mainContainerShadowColor,
                                  offset: const Offset(1.5, 2.5),
                                  spreadRadius: 5,
                                )
                              ],""" : ""}
                color: $color,
                borderRadius: BorderRadius.circular($radius)),
      ),
)
""";
}
