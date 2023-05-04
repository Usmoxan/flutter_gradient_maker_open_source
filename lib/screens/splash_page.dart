import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'home/main_home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final color1 = Color(Random().nextInt(0xffffffff));
  final color2 = Color(Random().nextInt(0xffffffff));

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomeMainScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 150, height: 150, child: Image.asset('assets/icon.png')),
            const SizedBox(height: 15),
            const Text(
              "Flutter Gradient Maker Pro",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(3.0, 0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(134, 0, 0, 0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 50,
              height: 50,
              child: LoadingAnimationWidget.inkDrop(
                color: Colors.white,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
