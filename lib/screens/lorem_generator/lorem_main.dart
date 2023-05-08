import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gradient_maker/utils/colors.dart';
import 'package:icons_plus/icons_plus.dart';

class LoremIpsumGenerator extends StatefulWidget {
  const LoremIpsumGenerator({Key? key}) : super(key: key);

  @override
  _LoremIpsumGeneratorState createState() => _LoremIpsumGeneratorState();
}

class _LoremIpsumGeneratorState extends State<LoremIpsumGenerator> {
  String _ipsumText = '';
  final parController = TextEditingController();
  int _letterCount = 0;
  String _selectedParagraphLength = 'Short';

  Future<void> _generateIpsum(int paragraphs) async {
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

    final dio = Dio();
    final response =
        await dio.get('https://loripsum.net/api/$paragraphs/$paragraphLength');

    try {
      if (response.statusCode == 200) {
        setState(() {
          _ipsumText = response.data.toString();
          _letterCount =
              _ipsumText.replaceAll('<p>', '').replaceAll('</p>', '').length;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: _ipsumText));

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text('Lorem Ipsum Generator'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.white),
                    child: Row(
                      children: [
                        const Icon(
                          IonIcons.chevron_down_circle,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
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
                      ],
                    ),
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
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _copyToClipboard,
                child: const Text('Copy'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
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
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Letter count: $_letterCount',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ])));
  }
}
