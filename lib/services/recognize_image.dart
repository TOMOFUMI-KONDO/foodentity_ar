import 'dart:convert';

import 'package:foodentity_ar/models/food.dart';
import 'package:foodentity_ar/models/identity.dart';
import 'package:foodentity_ar/services/endpoints.dart';
import 'package:http/http.dart' as http;

Future<RecognizeImageResponse> recognizeImage(String image) async {
  final response = await http.post(
    imageRecognitionEndpoint,
    headers: {"Content-Type": "application/json; charset=UTF-8"},
    body: jsonEncode({"image": image}),
  );

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body)["body"];
    return RecognizeImageResponse.fromJson(body);
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
