import 'package:flutter/material.dart';
import 'package:flutter_gradient_maker/screens/container_editor/main_page.dart';
import 'package:flutter_gradient_maker/screens/gradient_generator/pages/home_page.dart';
import 'package:badges/badges.dart' as badges;

import '../color_converter/main_page.dart';
import '../color_shade_generator/shade_generator_main.dart';

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({super.key});

  @override
  State<HomeScreenDesktop> createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  Widget _selected = const HomePage();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: media > 1280 ? null : AppBar(),
      body: Row(
        children: [
          media > 1280
              ? Container(
                  padding: const EdgeInsets.all(10),
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      ListItems(
                        title: 'Flutter Gradient Generator Pro',
                        badge: false,
                        color1: Colors.red,
                        color2: Colors.orange,
                        text: '',
                        onPressed: () {
                          setState(() {
                            _selected = const HomePage();
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      ListItems(
                        title: 'Container Editor',
                        badge: true,
                        color1: Colors.green,
                        color2: Colors.blue,
                        text: 'BETA',
                        onPressed: () {
                          setState(() {
                            _selected = const ContainerEditor();
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      ListItems(
                        title: 'Color Shade Generator',
                        badge: true,
                        color1: Colors.red,
                        color2: Colors.yellow,
                        text: 'NEW',
                        onPressed: () {
                          setState(() {
                            _selected = const ColorShadesScreen();
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      ListItems(
                        title: 'Color Converter',
                        badge: true,
                        color1: Colors.red,
                        color2: Colors.yellow,
                        text: 'NEW',
                        onPressed: () {
                          setState(() {
                            _selected = const ColorConverter();
                          });
                        },
                      ),
                    ],
                  ),
                )
              : Container(),
          Expanded(
            child: Container(
              color: const Color(0xFFF8F9FB),
              child: _selected,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              ListItems(
                title: 'Flutter Gradient Generator Pro',
                badge: false,
                color1: Colors.red,
                color2: Colors.orange,
                text: '',
                onPressed: () {
                  setState(() {
                    _selected = const HomePage();
                  });
                  Navigator.pop(context); // Close the drawer
                },
              ),
              const SizedBox(height: 10),
              ListItems(
                title: 'Container Editor',
                badge: true,
                color1: Colors.green,
                color2: Colors.blue,
                text: 'BETA',
                onPressed: () {
                  setState(() {
                    _selected = const ContainerEditor();
                  });
                  Navigator.pop(context); // Close the drawer
                },
              ),
              const SizedBox(height: 10),
              ListItems(
                title: 'Color Shade Generator',
                badge: true,
                color1: Colors.red,
                color2: Colors.yellow,
                text: 'NEW',
                onPressed: () {
                  setState(() {
                    _selected = const ColorShadesScreen();
                  });
                  Navigator.pop(context); // Close the drawer
                },
              ),
              const SizedBox(height: 10),
              ListItems(
                title: 'Color Converter',
                badge: true,
                color1: Colors.red,
                color2: Colors.yellow,
                text: 'NEW',
                onPressed: () {
                  setState(() {
                    _selected = const ColorConverter();
                  });
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  final String title;
  final String text;
  final Color color1;
  final Color color2;
  final bool badge;
  final VoidCallback onPressed;
  const ListItems({
    super.key,
    required this.title,
    required this.color1,
    required this.color2,
    required this.text,
    required this.badge,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (badge) {
      return badges.Badge(
        badgeStyle: badges.BadgeStyle(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          // shape: badges.BadgeShape.triangle,
          badgeGradient: badges.BadgeGradient.linear(
            colors: [
              color1,
              color2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        badgeAnimation: const badges.BadgeAnimation.fade(
          animationDuration: Duration(seconds: 1),
          loopAnimation: false,
        ),
        ignorePointer: false,
        badgeContent: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 8),
        ),
        position: badges.BadgePosition.topEnd(top: -12),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFFF8F9FB),
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(title),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFF8F9FB),
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(title),
          ),
        ),
      );
    }
  }
}
