import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../consts/api_endpoints.dart';
import '../../models/food.dart';
import '../../models/identity.dart';

Future<RecognizeImageResponse> recognizeImage(String image) async {
  final response = await http.post(
    imageRecognitionEndpoint,
    headers: {"Content-Type": "application/json; charset=UTF-8"},
    body: jsonEncode({"image": image}),
  );

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    // return RecognizeImageResponse.fromJson(body);
    print("body: $body");
    return RecognizeImageResponse(Food("hum"), [Identity("cochineal")]);
  } else {
    throw Exception("Failed to post request: ${response.body}");
  }
}

class RecognizeImageResponse {
  RecognizeImageResponse(this.food, this.identities);

  RecognizeImageResponse.fromJson(Map<String, dynamic> json) {
    this.food = Food(json["food"]);
    this.identities = (json["identities"] as List)
        .cast<String>()
        .map((identity) => Identity(identity))
        .toList();
  }

  Food food;
  List<Identity> identities;
}
