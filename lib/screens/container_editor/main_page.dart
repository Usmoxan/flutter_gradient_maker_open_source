import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_maker/screens/container_editor/responsive_ui/desktop.dart';
import 'package:flutter_gradient_maker/screens/container_editor/responsive_ui/mobile.dart';
import 'package:meta_seo/meta_seo.dart';

import '../../utils/colors.dart';

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
              'Flutter tools, Gradient maker,Flutter Container editor, Flutter Color shade Generator, Flutter HEX to RGBA converter. Flutter  Glassmorphism generator,Flutter  JSON to DART, Flutter  Lorem ipsum genrator The app is not fully finished Flutter little tools for you please use for free.');
      meta.keywords(
          keywords:
              'Flutter, Dart, Flutter tools, Gradient Maker Flutter, Web, tools, JSON to DART');
    }
    return Scaffold(
      backgroundColor: whiteColor,
      body: MediaQuery.of(context).size.width > 700
          ? const DesktopPage()
          : const MobilePage(),
    );
  }
}
