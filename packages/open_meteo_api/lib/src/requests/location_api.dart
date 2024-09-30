import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;

import '../exceptions/weather_exception.dart';
import '../models/location.dart';

class LocationApi {
  static const _authority = 'geocoding-api.open-meteo.com';
  static const _path = '/v1/search';

  final http.Client httpClient;

  const LocationApi(http.Client client) : httpClient = client;

  Future<Location> getLocation(String city) async {
      
    Map<String, dynamic> parameters = {
      'name': city,
      'count': '1',
    };

    final url = Uri.https(_authority, _path, parameters);

    final response = await _getResponse(url);
    
    
    final jsonResponse = convert.jsonDecode(response.body);

    final location = Location.fromJson(jsonResponse);

  

    return location;
  }

  Future<Response> _getResponse(Uri url) async {
    
    final response = await httpClient.get(url);

    if(response.statusCode != 200) {
      throw LocationRequestException();
    }

    return response;
  }
}
