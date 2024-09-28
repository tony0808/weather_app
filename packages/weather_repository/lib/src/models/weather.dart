
enum WeatherCondition {
  clear,
  cloudy,
  foggy,
  drizzle,
  rainy,
  snowy,
  thunderstorm,
  unknown
}

class Weather {

  final String location;
  final double temperature;
  final WeatherCondition condition;

  const Weather({required this.location, required this.temperature, required this.condition});
}