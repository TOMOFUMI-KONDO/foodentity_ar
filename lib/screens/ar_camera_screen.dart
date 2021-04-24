import 'dart:convert';
import 'dart:typed_data';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:foodentity_ar/models/identity.dart';
import 'package:foodentity_ar/services/api/recognize_image.dart';
import 'package:foodentity_ar/services/ar/ar_node_manager.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments =
        ModalRoute.of(context).settings.arguments as ArCameraScreenArguments;
    final byteData = arguments.byteData;

    final base64Image = base64.encode(byteData);
    print(base64Image);

    recognizeImage(base64Image).then((result) {
      for (final identity in result.identities) {
        _arNodeManager.addImage(identity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 2,
              child: RepaintBoundary(
                // key: _globalKey,
                child: ArCoreView(
                  onArCoreViewCreated: _onArCoreViewCreated,
                  enableTapRecognizer: true,
                  debug: true,
                ),
              ),
            ),
            Expanded(child: IdentityDetail(_displayedIdentity)),
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

class ArCameraScreenArguments {
  const ArCameraScreenArguments(this.byteData);
  final Uint8List byteData;
}
