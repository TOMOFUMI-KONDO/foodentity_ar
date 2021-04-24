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
              color: baseColorLight,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                'これって何から\nできてるの？',
                style: TextStyle(
                  color: mainColorDark,
                  fontWeight: FontWeight.w900,
                  fontSize: 52,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
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
                      fontSize: 24, color: Colors.white, fontFamily: mainFont),
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
