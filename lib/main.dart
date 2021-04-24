import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:foodentity_ar/screens/ar_camera_screen.dart';
import 'package:foodentity_ar/screens/home.dart';

void main() async {
  await DotEnv.load(fileName: ".env");
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
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.screen_id,
      routes: {
        HomeScreen.screen_id: (_) => HomeScreen(),
        ArCameraScreen.screen_id: (_) => ArCameraScreen(),
      },
    );
  }
}
