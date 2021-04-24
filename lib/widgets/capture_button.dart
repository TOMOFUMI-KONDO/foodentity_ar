import 'package:flutter/material.dart';
import 'package:foodentity_ar/services/api/recognize_image.dart';
import 'package:foodentity_ar/services/ar/ar_node_manager.dart';
import 'package:foodentity_ar/services/image/convert_widget_to_image.dart';

class CaptureButton extends StatelessWidget {
  CaptureButton(this.setWidget, this._globalKey, this._arNodeManager);

  final void Function(Widget) setWidget;
  final GlobalKey _globalKey;
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

    setWidget(await convertWidgetToImage(_globalKey));

    final base64Image = await convertWidgetToBase64Image(_globalKey);
    print(base64Image);
    final result = await recognizeImage(base64Image);

    for (final identity in result.identities) {
      _arNodeManager.addImage(identity);
    }
  }
}
