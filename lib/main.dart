import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';

import 'objects/cube.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ArCoreController _arCoreController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Foodentity AR')),
        body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    _arCoreController = controller;
    addImage(
      _arCoreController,
      'assets/kaigaramushi_1.png',
      {'x': -0.5, 'y': 0.5, 'z': -3.5},
    );
    addImage(
      _arCoreController,
      'assets/kaigaramushi_2.png',
      {'x': -1.5, 'y': 0.5, 'z': -3.5},
    );
  }

  @override
  void dispose() {
    _arCoreController?.dispose();
    super.dispose();
  }
}
