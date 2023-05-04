import 'package:flutter/material.dart';

import 'home_screen_desktop.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreenDesktop(),
    );
  }
}
