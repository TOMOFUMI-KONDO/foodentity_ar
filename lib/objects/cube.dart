import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

Future addImage(
  ArCoreController controller,
  String assetPath,
  Map<String, double> position,
) async {
  final imageBytes = await rootBundle.load(assetPath);
  final image = ArCoreImage(
    bytes: imageBytes.buffer.asUint8List(),
    width: 500,
    height: 500,
  );
  final node = ArCoreNode(
    image: image,
    // position: vector.Vector3(-1.5, 0.5, -3.5),
    position: vector.Vector3(position['x'], position['y'], position['z']),
  );
  controller.addArCoreNode(node);
}
