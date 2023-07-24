import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article.dart';
import '../models/random_picture.dart';

class APIRequest {
  Future<RandomPicture> fetchDataImage({required String cat}) async {
    http.Response response = await http.get(
      Uri.parse('https://random.imagecdn.app/v1/image?&$cat=buildings&format=json'),
    );

    if (response.statusCode == 200) {

      Map<String, dynamic> jsonData = jsonDecode(response.body);

      RandomPicture _model = RandomPicture.fromJson(jsonData);

      return _model;
    }
    throw Exception('Failed to load data');
  }

  Future<Article> fetchDataArticle() async {
    http.Response response = await http.get(
      Uri.parse('https://api.quotable.io/random'),
    );


    if (response.statusCode == 200) {

      // Decode the response body to a Map
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      Article _model = Article.fromJson(jsonData);

      return _model;
    }
    throw Exception('Failed to load data');
  }
}
