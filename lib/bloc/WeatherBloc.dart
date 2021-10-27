import 'dart:convert';

import 'package:flutter_app_bloc_api1/bloc/WeatherState.dart';
import 'package:flutter_app_bloc_api1/data/remote/api_services.dart';
import 'package:flutter_app_bloc_api1/model/base_exception.dart';
import 'package:flutter_app_bloc_api1/model/weather_error_response.dart';
import 'package:flutter_app_bloc_api1/model/weather_success_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'WeatherEvent.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  ApiService apiService = ApiService();

  WeatherBloc(WeatherState initialState) : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    Response? response;
    try {
      response = await apiService.fetchWeather('NewYork');
      if (response.statusCode == 200) {
        yield WeatherSuccessState(
            WeatherSuccessResponse.fromJson(jsonDecode(response.body)));
      } else {
        yield WeatherErrorState(
            baseException: BaseException.checkCod(response.statusCode));
      }
    } catch (e) {
      yield WeatherErrorState(
          weatherErrorResponse:
              WeatherErrorResponse.fromJson(jsonDecode(response!.body)));
    }
  }
}
