import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Future<String> convertWidgetToBase64Image(GlobalKey _globalKey) async {
  try {
    final RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    final ui.Image image = await boundary.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return base64.encode(byteData.buffer.asUint8List());
  } catch (error) {
    print(error);
  }

  return null;
}

Future<Image> convertWidgetToImage(GlobalKey _globalKey) async {
  final RenderRepaintBoundary boundary =
      _globalKey.currentContext.findRenderObject();
  final ui.Image image = await boundary.toImage(pixelRatio: 3);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return Image.memory(byteData.buffer.asUint8List());
}
