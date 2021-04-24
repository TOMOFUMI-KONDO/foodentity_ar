import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

Future<Uint8List> pickImage() async {
  final file = await ImagePicker().getImage(source: ImageSource.camera);
  final byteData = await file.readAsBytes();

  return byteData;
}
