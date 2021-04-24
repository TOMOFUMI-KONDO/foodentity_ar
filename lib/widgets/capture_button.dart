import 'package:flutter/material.dart';
import 'package:foodentity_ar/services/api/recognize_image.dart';
import 'package:foodentity_ar/services/ar/ar_node_manager.dart';

class CaptureButton extends StatelessWidget {
  const CaptureButton(this._arNodeManager);

  final ArNodeManager _arNodeManager;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: handleTap,
      icon: const Icon(Icons.camera),
      iconSize: 48,
      color: Colors.green,
    );
  }

  Future handleTap() async {
    _arNodeManager.clear();

    final result = await recognizeImage("hogehoge");

    for (final identity in result.identities) {
      _arNodeManager.addImage(identity);
    }
  }
}
