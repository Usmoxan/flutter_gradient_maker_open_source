import 'package:flutter/material.dart';
import 'package:flutter_gradient_maker/screens/gradient_generator/pages/home_page.dart';

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({super.key});

  @override
  State<HomeScreenDesktop> createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  final Widget _selected = const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: const [
                ListItems(
                  title: 'Flutter Gradient Generator Pro',
                ),
                SizedBox(height: 10),
                ListItems(
                  title: 'Container Editor',
                ),
                SizedBox(height: 10),
                ListItems(
                  title: 'Color Shade Generator',
                ),
                SizedBox(height: 10),
                ListItems(
                  title: 'Color Converter',
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFFF8F9FB),
              child: _selected,
            ),
          ),
        ],
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  final String title;
  const ListItems({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF8F9FB),
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
