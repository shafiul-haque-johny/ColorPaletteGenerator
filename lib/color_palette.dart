import 'dart:math';

import 'package:flutter/material.dart';

class ColorPalette extends StatefulWidget {
  const ColorPalette({Key? key}) : super(key: key);

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  List<Color> cPalette = generateRandomPalette();

  static List<Color> generateRandomPalette() {
    final random = Random();
    return List.generate(
      4,
      (_) => Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      ),
    );
  }

  void regeneratePalette() {
    setState(() {
      cPalette = generateRandomPalette();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Palette Generator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (Color color in cPalette)
              Container(
                width: 100,
                height: 100,
                color: color,
                margin: const EdgeInsets.all(8.0),
              ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: regeneratePalette,
                child: const Text('Generate new palette'))
          ],
        ),
      ),
    );
  }
}
