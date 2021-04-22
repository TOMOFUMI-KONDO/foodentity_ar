import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void addSphere(ArCoreController controller) {
  final material = ArCoreMaterial(color: Color.fromARGB(120, 66, 134, 244));
  final sphere = ArCoreSphere(
    materials: [material],
    radius: 0.1,
  );
  final node = ArCoreNode(
    shape: sphere,
    position: vector.Vector3(0, 0, -1.5),
  );
  controller.addArCoreNode(node);
}
