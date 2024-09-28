import 'package:open_meteo_api/open_meteo_api.dart' hide Weather;
import 'package:weather_repository/src/models/models.dart';

class WeatherRepository {
  final OpenMeteoApi openMeteoApi;

  const WeatherRepository({required this.openMeteoApi});

  Future<Weather> getWeather(String city) async {
    final location = await openMeteoApi.fetchLocation(city);
    final weather = await openMeteoApi.fetchWeather(location.latitude.toString(), location.longitude.toString());

    return Weather(
      location: city,
      temperature: weather.temperature,
      condition: getWeatherCondition(weather.weatherCode),
    );
  }

  WeatherCondition getWeatherCondition(int weatherCode) {
    switch (weatherCode) {
      case 0:
        return WeatherCondition.clear;
      case 1:
      case 2:
      case 3:
        return WeatherCondition.cloudy;
      case 45:
      case 48:
        return WeatherCondition.foggy;
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
        return WeatherCondition.drizzle;
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
        return WeatherCondition.rainy;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return WeatherCondition.snowy;
      case 95:
      case 96:
      case 99:
        return WeatherCondition.thunderstorm;
      default:
        return WeatherCondition.unknown;
    }
  }
}
