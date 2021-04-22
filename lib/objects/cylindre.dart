import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void addCylindre(ArCoreController controller) {
  final material = ArCoreMaterial(
    color: Colors.red,
    reflectance: 1.0,
  );
  final cylindre = ArCoreCylinder(
    materials: [material],
    radius: 0.5,
    height: 0.3,
  );
  final node = ArCoreNode(
    shape: cylindre,
    position: vector.Vector3(0.0, -0.5, -2.0),
  );
  controller.addArCoreNode(node);
}
