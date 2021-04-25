import 'package:flutter/material.dart';
import 'package:foodentity_ar/consts/colors.dart';
import 'package:foodentity_ar/consts/fonts.dart';
import 'package:foodentity_ar/screens/ar_camera_screen.dart';
import 'package:foodentity_ar/services/image/pick_image.dart';

class HomeScreen extends StatelessWidget {
  static const screen_id = "home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: baseColor200,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    color: mainColor700,
                    fontFamily: mainFont,
                  ),
                  children: [
                    TextSpan(text: 'それって何から\nできてるの？\n'),
                    TextSpan(
                      text: 'AR',
                      style: const TextStyle(fontSize: 36, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: TextButton(
                onPressed: () => _handleTap(context),
                style: TextButton.styleFrom(padding: const EdgeInsets.all(15)),
                child: const Text(
                  '正体を調べる',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: mainFont,
                  ),
                ),
              ),
            ),
          ],
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
