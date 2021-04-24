import 'package:flutter_dotenv/flutter_dotenv.dart';

final imageRecognitionEndpoint = Uri.https(
  // "owyjrafsy3.execute-api.ap-northeast-1.amazonaws.com",
  env["IMAGE_RECOGNITION_API_HOST"],
  env["IMAGE_RECOGNITION_API_PATH"],
);
