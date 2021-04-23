import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArNodeCreator {
  ArNodeCreator(this._arCoreController);

  final ArCoreController _arCoreController;
  double count = 0;

  Future addImage(String assetPath) async {
    final imageBytes = await rootBundle.load(assetPath);
    final image = ArCoreImage(
      bytes: imageBytes.buffer.asUint8List(),
      width: 300,
      height: 300,
    );
    final node = ArCoreNode(
      image: image,
      position: vector.Vector3(count / 2, 0, -3.5),
    );

    _arCoreController.addArCoreNode(node);

    count++;
  }
}
