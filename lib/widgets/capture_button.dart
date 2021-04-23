import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:foodentity_ar/services/recognize_image.dart';

class CaptureButton extends StatelessWidget {
  const CaptureButton(this._arCoreController);

  final ArCoreController _arCoreController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: handleTap,
      child: const Text('Capture!'),
    );
  }

  Future handleTap() async {
    final result = await recognizeImage("hogehoge");
    debugPrint(result.food.name);
    debugPrint(result.identities.map((identity) => identity.name).join(','));
    // addImage(_arCoreController, 'assets/kaigaramushi_1.png', [-0.5, 0.5, -3.5]);
    // addImage(_arCoreController, 'assets/kaigaramushi_2.png', [-1.5, 0.5, -3.5]);
  }
}
