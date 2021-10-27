import 'package:flutter_app_bloc_api1/model/base_exception.dart';
import 'package:flutter_app_bloc_api1/model/weather_error_response.dart';
import 'package:flutter_app_bloc_api1/model/weather_success_response.dart';

class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  WeatherSuccessResponse? weatherSuccessResponse;

  WeatherSuccessState(this.weatherSuccessResponse);
}

class WeatherErrorState extends WeatherState {
  WeatherErrorResponse? weatherErrorResponse;
  BaseException? baseException;

  WeatherErrorState({this.weatherErrorResponse, this.baseException});
}
