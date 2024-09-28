class Weather {
  final double temperature;
  final int weatherCode;

  const Weather({required this.temperature, required this.weatherCode});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['current_weather']['temperature'],
      weatherCode: json['current_weather']['weathercode'],
    );
  }
}
