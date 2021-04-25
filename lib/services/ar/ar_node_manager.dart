import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:foodentity_ar/consts/enums/image_path.dart';
import 'package:foodentity_ar/models/identity.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArNodeManager {
  ArNodeManager(this._arCoreController);

  static const columns = 2; // 表示する画像の列数

  final ArCoreController _arCoreController;
  double count = 0;

  void clear() {
    // FIXME: なぜかこれで削除できない
    // for (int i = 0; i < count; i++) {
    //   _arCoreController.removeNodeWithIndex(i);
    //   // _arCoreController.removeNodeWithIndex(0);
    // }
    count = 0;
  }

  Future addImage(Identity identity) async {
    final imageName = identity.image.value;
    final imageBytes = await rootBundle.load("assets/$imageName");
    final image = ArCoreImage(
      bytes: imageBytes.buffer.asUint8List(),
      width: 300,
      height: 300,
    );

    final node = ArCoreNode(
      name: identity.name, // identityの説明文
      image: image,
      position: vector.Vector3(
        count % columns * 0.5,
        -0.5 - (count / columns).floor() * 0.5,
        -3.5,
      ),
      rotation: vector.Vector4(0, 0, 0, 0),
    );

    _arCoreController.addArCoreNode(node);

    count++;
  }
}
