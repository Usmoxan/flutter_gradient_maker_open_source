import 'package:flutter/material.dart';
import 'package:dart_style/dart_style.dart';

class DartCodeFormatter extends StatefulWidget {
  const DartCodeFormatter({Key? key}) : super(key: key);

  @override
  _DartCodeFormatterState createState() => _DartCodeFormatterState();
}

class _DartCodeFormatterState extends State<DartCodeFormatter> {
  final _codeController = TextEditingController();
  final _formattedCodeController = TextEditingController();
  final _dartFormatter = DartFormatter();

  void _formatCode() {
    final unformattedCode = _codeController.text;
    final formattedCode = _dartFormatter.format(unformattedCode);
    _formattedCodeController.text = formattedCode;
  }

  @override
  void dispose() {
    _codeController.dispose();
    _formattedCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Code Formatter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _codeController,
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: 'Input unformatted Dart code',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _formatCode,
                child: const Text('Format Code'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _formattedCodeController,
                readOnly: true,
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: 'Formatted Dart code',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
