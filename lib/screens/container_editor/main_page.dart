import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_maker/screens/container_editor/responsive_ui/desktop.dart';
import 'package:flutter_gradient_maker/screens/container_editor/responsive_ui/mobile.dart';
import 'package:meta_seo/meta_seo.dart';

class ContainerEditor extends StatefulWidget {
  const ContainerEditor({super.key});

  @override
  State<ContainerEditor> createState() => _ContainerEditorState();
}

class _ContainerEditorState extends State<ContainerEditor> {
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
    return Scaffold(
      body: MediaQuery.of(context).size.width > 700
          ? const DesktopPage()
          : const MobilePage(),
    );
  }
}
