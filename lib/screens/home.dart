import 'package:flutter/material.dart';
import 'package:foodentity_ar/screens/ar_camera_screen.dart';

class HomeScreen extends StatelessWidget {
  static const screen_id = "home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: TextButton(
          onPressed: () => Navigator.of(context).pushNamed(
            ArCameraScreen.screen_id,
          ),
          child: const Text('写真を撮る'),
        ),
      ),
    ));
  }
}
