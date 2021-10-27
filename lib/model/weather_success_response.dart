

class WeatherSuccessResponse{
  Request? request;
  Location? location;
  Current? current;

  WeatherSuccessResponse.fromJson(Map<String,dynamic> json){
    request = Request.fromJson(json['request']);
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
  }
}

class Request {
  String? query;

  Request.fromJson(Map<String,dynamic> json){
    query = json['query'];
  }

}

class Location {
  String? lat;
  String? lon;

  Location.fromJson(Map<String,dynamic> json){
    lat = json['lat'];
    lon = json['lon'];
  }
}

class Current {
  int? temperature;
  List<dynamic>? weather_icons;
  List<dynamic>? weather_descriptions;

  Current.fromJson(Map<String,dynamic> json){
    temperature = json['temperature'];
    weather_icons = json['weather_icons'];
    weather_descriptions = json['weather_descriptions'];
  }
}
