import 'package:flutter/material.dart';

const String copyText = "Copy Gradient Code";
const String copiedText = "Gradient Code Copied";
const String creatorName = "Created by Hayrulloh & Usmoxan";
String generateRadialCode(Color color1, Color color2, Alignment begin) {
  return """
    RadialGradient(
      colors: [
        $color1,
        $color2,
      ],
      stops: const [0, 1],
      center: $begin,
      radius: 0.8,
    ),
  """;
}

String generateLinearCode(Color color1, Color color2, Alignment begin, end) {
  return """
     LinearGradient(
        colors: [
           $color1,
            $color2,
        ],
        begin: $begin,
        end: $end,
      )
    """;
}

String generateGlassCode(double blurRadius, double opacity, Color mainColor) {
  return """
     ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: $blurRadius,
                                          sigmaY: $blurRadius),
                                      child: Container(
                                        width: 336,
                                        height: 338,
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: $mainColor,
                                                width: .8),
                                            color:
                                                $mainColor.withOpacity($opacity),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        
                                      ),
                                    ),
                                  ),
    """;
}
