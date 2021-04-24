import 'package:flutter/material.dart';
import 'package:foodentity_ar/screens/ar_camera_screen.dart';
import 'package:foodentity_ar/services/image/pick_image.dart';

class HomeScreen extends StatelessWidget {
  static const screen_id = "home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () => _handleTap(context),
            child: const Text('写真を撮る'),
          ),
        ),
      ),
    );
  }

  Future _handleTap(BuildContext context) async {
    final byteData = await pickImage();
    Navigator.of(context).pushNamed(
      ArCameraScreen.screen_id,
      arguments: ArCameraScreenArguments(byteData),
    );
  }
}
