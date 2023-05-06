import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class LoremIpsumGenerator extends StatefulWidget {
  const LoremIpsumGenerator({super.key});

  @override
  _LoremIpsumGeneratorState createState() => _LoremIpsumGeneratorState();
}

class _LoremIpsumGeneratorState extends State<LoremIpsumGenerator> {
  String _ipsumText = '';
  final parController = TextEditingController();
  int _letterCount = 0;
  String _selectedParagraphLength = 'Short';

  void _generateIpsum(int paragraphs) async {
    var paragraphLength = '';
    switch (_selectedParagraphLength) {
      case 'Short':
        paragraphLength = 'short';
        break;
      case 'Medium':
        paragraphLength = 'medium';
        break;
      case 'Long':
        paragraphLength = 'long';
        break;
      case 'Very Long':
        paragraphLength = 'verylong';
        break;
      default:
        paragraphLength = 'short';
        break;
    }

    var response = await http.get(
      Uri.parse('https://loripsum.net/api/$paragraphs/$paragraphLength'),
    );

    if (response.statusCode == 200) {
      setState(() {
        _ipsumText = utf8.decode(response.bodyBytes);
        _letterCount =
            _ipsumText.replaceAll('<p>', '').replaceAll('</p>', '').length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lorem Ipsum Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'Short',
                      child: Text('Short'),
                    ),
                    const PopupMenuItem(
                      value: 'Medium',
                      child: Text('Medium'),
                    ),
                    const PopupMenuItem(
                      value: 'Long',
                      child: Text('Long'),
                    ),
                    const PopupMenuItem(
                      value: 'Very Long',
                      child: Text('Very Long'),
                    ),
                  ],
                  onSelected: (value) {
                    setState(() {
                      _selectedParagraphLength = value;
                    });
                  },
                  child: Text(_selectedParagraphLength),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: parController,
                    decoration: const InputDecoration(
                      labelText: 'Number of paragraphs',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _generateIpsum(int.parse(parController.text));
              },
              child: const Text('Generate'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        readOnly: true,
                        controller: TextEditingController(
                            text: _ipsumText
                                .replaceAll('<p>', '')
                                .replaceAll('</p>', '')),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 16),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        maxLines: null,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Letter count: $_letterCount',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
