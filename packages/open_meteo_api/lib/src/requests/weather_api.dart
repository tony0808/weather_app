import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;

import '../exceptions/weather_exception.dart';
import '../models/models.dart';

class WeatherApi {
  static const _authority = 'api.open-meteo.com';
  static const _path = '/v1/forecast';

  final http.Client httpClient;

  const WeatherApi(http.Client client) : httpClient = client;

  Future<Weather> getWeather(String lat, String lon) async {

    final parameters = {
      'latitude' : lat,
      'longitude' : lon,
      'current_weather' : 'true',
    };

    final url = Uri.https(_authority, _path, parameters);
    
    final response = await _getResponse(url);
    final jsonResponse = convert.jsonDecode(response.body);
    
    final weather = Weather.fromJson(jsonResponse);

    return weather;
  }

  Future<Response> _getResponse(Uri url) async {
    final response = await httpClient.get(url);

    if(response.statusCode != 200) {
      throw WeatherRequestException();
    }

    return response;
  }
}