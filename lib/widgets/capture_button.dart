import 'package:flutter/material.dart';
import 'package:foodentity_ar/services/api/recognize_image.dart';
import 'package:foodentity_ar/services/ar/image.dart';
import 'package:foodentity_ar/services/consts/enums/image_path.dart';

class CaptureButton extends StatelessWidget {
  CaptureButton(this._arNodeCreator);

  final ArNodeCreator _arNodeCreator;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: handleTap,
      child: const Text('Capture!'),
    );
  }

  Future handleTap() async {
    final result = await recognizeImage("hogehoge");

    for (final identity in result.identities) {
      final imagePath = identityImagePathMap[identity.name].value;
      _arNodeCreator.addImage(imagePath);
    }
  }
}
