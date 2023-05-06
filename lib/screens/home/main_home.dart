import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';

import 'home_screen_desktop.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
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
    return const Scaffold(
      body: HomeScreenDesktop(),
    );
  }
}
