import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/googlecode.dart';

class CodeViewerDialog extends StatelessWidget {
  final String code;

  const CodeViewerDialog({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    List<String> codeLines = code.split('\n');
    int lineCount = codeLines.length;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < lineCount; i++)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40.0,
                    child: SelectableText(
                      '${i + 1}',
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: HighlightView(
                      // The original code to be highlighted
                      codeLines[i],

                      // Specify language
                      // It is recommended to give it a value for performance
                      language: 'dart',

                      // Specify highlight theme
                      // All available themes are listed in `themes` folder
                      theme: googlecodeTheme,

                      // Specify text style
                      textStyle: const TextStyle(
                        // fontFamily: 'My awesome monospace font',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
