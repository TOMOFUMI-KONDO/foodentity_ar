import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:foodentity_ar/services/ar/image.dart';
import 'package:foodentity_ar/widgets/capture_button.dart';

class ArCameraScreen extends StatefulWidget {
  static const screen_id = "ar_camera_screen";

  @override
  _ArCameraScreenState createState() => _ArCameraScreenState();
}

class _ArCameraScreenState extends State<ArCameraScreen> {
  ArCoreController _arCoreController;
  ArNodeCreator _arNodeCreator;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight / 2,
            child: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated),
            // child: Container(),
          ),
          CaptureButton(_arNodeCreator),
        ],
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    _arCoreController = controller;
    _arNodeCreator = ArNodeCreator(_arCoreController);
  }

  @override
  void dispose() {
    _arCoreController?.dispose();
    super.dispose();
  }
}
