import 'package:flutter/material.dart';
import 'package:flutter_gradient_maker/container_editor/responsive_ui/desktop.dart';
import 'package:flutter_gradient_maker/container_editor/responsive_ui/mobile.dart';

class ContainerEditor extends StatefulWidget {
  const ContainerEditor({super.key});

  @override
  State<ContainerEditor> createState() => _ContainerEditorState();
}

class _ContainerEditorState extends State<ContainerEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).size.width > 500
          ? const DesktopPage()
          : const MobilePage(),
    );
  }
}
