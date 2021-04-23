import 'package:flutter/material.dart';
import 'package:foodentity_ar/screens/ar_camera_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ArCameraScreen.screen_id,
      routes: {
        ArCameraScreen.screen_id: (_) => ArCameraScreen(),
      },
    );
  }
}
