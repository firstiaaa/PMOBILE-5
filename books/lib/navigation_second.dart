import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  _NavigationSecondState createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  Color? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedColor == Colors.red.shade700
                    ? Colors.red.shade900
                    : Colors.red.shade700,
              ),
              child: const Text('Red'),
              onPressed: () {
                _navigateAndGetColor(context, Colors.red.shade700);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedColor == Colors.green.shade700
                    ? Colors.green.shade900
                    : Colors.green.shade700,
              ),
              child: const Text('Green'),
              onPressed: () {
                _navigateAndGetColor(context, Colors.green.shade700);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedColor == Colors.blue.shade700
                    ? Colors.blue.shade900
                    : Colors.blue.shade700,
              ),
              child: const Text('Blue'),
              onPressed: () {
                _navigateAndGetColor(context, Colors.blue.shade700);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateAndGetColor(BuildContext context, Color color) async {
    final selectedColor = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NavigationThird(
          initialColor: Colors.transparent,
        ),
      ),
    );
    if (selectedColor != null) {
      setState(() {
        _selectedColor = selectedColor;
      });
      Navigator.pop(context, color);
    }
  }
}

class NavigationThird extends StatefulWidget {
  final Color initialColor;

  const NavigationThird({super.key, required this.initialColor});

  @override
  _NavigationThirdState createState() => _NavigationThirdState();
}

class _NavigationThirdState extends State<NavigationThird> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Third Screen'),
      ),
      body: Center(
        child: Text('Navigation Third Screen'),
      ),
    );
  }
}