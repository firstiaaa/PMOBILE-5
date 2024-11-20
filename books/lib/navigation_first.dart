import 'package:flutter/material.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = const Color.fromRGBO(207, 31, 157, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation First Screen firstiaaa'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context);
          }),
      ),
    );
  }

Future<void> _navigateAndGetColor(BuildContext context) async {
    final selectedColor = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ColorPickerScreen()),
    );
    if (selectedColor != null) {
      setState(() {
        color = selectedColor;
      });
    }
  }
}

class ColorPickerScreen extends StatefulWidget {
  const ColorPickerScreen({super.key});

  @override
  State<ColorPickerScreen> createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Picker'),
      ),
      body: Center(
        child: Text('Color Picker Screen'),
      ),
    );
  }
}

