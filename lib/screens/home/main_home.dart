import 'package:flutter/material.dart';

import 'home_screen_desktop.dart';
import 'home_screen_mobile.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size.width;
    return Scaffold(
      body: media > 1280 ? const HomeScreenDesktop() : const HomeScreenMobile(),
    );
  }
}
