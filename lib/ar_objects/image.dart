import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

Future addImage(
  ArCoreController controller,
  String assetPath,
  List<double> position,
) async {
  final imageBytes = await rootBundle.load(assetPath);
  final image = ArCoreImage(
    bytes: imageBytes.buffer.asUint8List(),
    width: 500,
    height: 500,
  );
  final node = ArCoreNode(
    image: image,
    position: vector.Vector3(position[0], position[1], position[2]),
  );

  controller.addArCoreNode(node);
}
