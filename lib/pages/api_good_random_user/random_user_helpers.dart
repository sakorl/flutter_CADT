
import '../api_good_random_user/random_user_models.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RandomUserHelper{
  static Future<RandomUserModel> read() async {
    final String url = "https://randomuser.me/api?results=50";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return compute(getRandomUser, response.body);
      } else {
        throw Exception("Error while reading, code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error while reading, ${e.toString()}");
    }
  }
}
