import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  _NavigationDialogScreenState createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color _backgroundColor = const Color.fromARGB(255, 175, 182, 188);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _backgroundColor,
          ),
          child: const Text('Change Color'),
          onPressed: () {
            _showColorPickerDialog(context);
          },
        ),
      ),
    );
  }

  Future<void> _showColorPickerDialog(BuildContext context) async {
    final selectedColor = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ColorPickerDialog(
          initialColor: _backgroundColor,
        ),
      ),
    );

    if (selectedColor != null) {
      setState(() {
        _backgroundColor = selectedColor;
      });
    }
  }
}

class ColorPickerDialog extends StatefulWidget {
  final Color initialColor;

  const ColorPickerDialog({super.key, required this.initialColor});

  @override
  _ColorPickerDialogState createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  late Color color;
  Color _selectedColor = Colors.blue.shade700;

  @override
  void initState() {
    super.initState();
    color = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Picker'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Select'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }

 Future<void> _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Red'),
              onPressed: () {
                setState(() {
                  _selectedColor = Colors.red.shade700;
                });
                Navigator.pop(context, _selectedColor);
              },
            ),
            TextButton(
              child: const Text('Green'),
              onPressed: () {
                setState(() {
                  _selectedColor = Colors.green.shade700;
                });
                Navigator.pop(context, _selectedColor);
              },
            ),
            TextButton(
              child: const Text('Blue'),
              onPressed: () {
                setState(() {
                  _selectedColor = Colors.blue.shade700;
                });
                Navigator.pop(context, _selectedColor);
              },
            ),
          ],
        );
      },
    );
  }
}