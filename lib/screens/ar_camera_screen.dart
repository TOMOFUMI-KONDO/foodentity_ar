import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:foodentity_ar/models/identity.dart';
import 'package:foodentity_ar/services/ar/ar_node_manager.dart';
import 'package:foodentity_ar/widgets/capture_button.dart';
import 'package:foodentity_ar/widgets/identity_detail.dart';

class ArCameraScreen extends StatefulWidget {
  static const screen_id = "ar_camera_screen";

  @override
  _ArCameraScreenState createState() => _ArCameraScreenState();
}

class _ArCameraScreenState extends State<ArCameraScreen> {
  ArCoreController _arCoreController;
  ArNodeManager _arNodeManager;
  Identity _displayedIdentity;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 2,
              child: ArCoreView(
                onArCoreViewCreated: _onArCoreViewCreated,
                enableTapRecognizer: true,
                debug: true,
              ),
            ),
            Expanded(child: IdentityDetail(_displayedIdentity)),
            CaptureButton(_arNodeManager),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    setState(() {
      _arCoreController = controller;
      _arCoreController.onNodeTap = _setDisplayedIdentity;
      _arNodeManager = ArNodeManager(_arCoreController);
    });
  }

  void _setDisplayedIdentity(String name) {
    final identity = Identity.fromName(name);
    setState(() => _displayedIdentity = identity);
  }

  @override
  void dispose() {
    _arCoreController?.dispose();
    super.dispose();
  }
}
