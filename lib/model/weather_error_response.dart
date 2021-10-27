
import 'package:flutter_app_bloc_api1/model/weather_response.dart';

class WeatherErrorResponse{
  bool? success;
  Error? error;

  WeatherErrorResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = Error.fromJson(json['error']);
  }
}

class Error {
  int? code;
  String? type;
  String? info;

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    type = json['type'];
    info = json['info'];
  }
}
