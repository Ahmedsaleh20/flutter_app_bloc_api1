import 'dart:convert';

import 'package:flutter_app_bloc_api1/model/weather_success_response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'constants.dart';

class ApiService {
  //single tone
  static ApiService? _apiService;

  ApiService._instance();

  factory ApiService() {
    if (_apiService == null) {
      _apiService = ApiService._instance();
    }
    return _apiService!;
  }

  Future<Response> fetchWeather(String cityName) async {
    String url = '$BASE_URL/current?access_key=$API_KEY&query=$cityName';
    Response response = await http.get(Uri.parse(url));
    return response;
  }
}