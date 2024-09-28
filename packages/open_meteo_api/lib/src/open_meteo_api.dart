import 'package:open_meteo_api/src/models/models.dart';
import 'package:open_meteo_api/src/requests/requests.dart';
import 'package:http/http.dart' as http;

class OpenMeteoApi {
  LocationApi locationApi;
  WeatherApi weatherApi;

  OpenMeteoApi(http.Client client)
      : locationApi = LocationApi(client),
        weatherApi = WeatherApi(client);

  Future<Location> fetchLocation(String city) async {
    return locationApi.getLocation(city);
  }

  Future<Weather> fetchWeather(String lat, String lon) async {
    return weatherApi.getWeather(lat, lon);
  }
}
