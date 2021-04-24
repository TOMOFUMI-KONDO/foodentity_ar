import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:foodentity_ar/consts/colors.dart';
import 'package:foodentity_ar/consts/fonts.dart';
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
      theme: ThemeData(
        primarySwatch: baseColor,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: Colors.white),
            backgroundColor: mainColor,
            padding: const EdgeInsets.all(12),
          ),
        ),
        fontFamily: mainFont,
      ),
      initialRoute: HomeScreen.screen_id,
      routes: {
        HomeScreen.screen_id: (_) => HomeScreen(),
        ArCameraScreen.screen_id: (_) => ArCameraScreen(),
      },
    );
  }
}
