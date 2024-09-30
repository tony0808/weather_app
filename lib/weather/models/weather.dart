import 'package:equatable/equatable.dart';
import 'package:weather_repository/weather_repository.dart' as weather_repository;
import 'package:weather_repository/weather_repository.dart';

enum TemperatureUnits {
  celsius,
  fahreinheit,
}

class Weather extends Equatable {
  final String location;
  final double temperature;
  final WeatherCondition condition;

  const Weather({required this.location, required this.temperature, required this.condition});

  static const empty = Weather(
    condition: WeatherCondition.unknown,
    location: '-',
    temperature: 0.0,
  );

  factory Weather.fromRepository(weather_repository.Weather weather) {
    return Weather(
      location: weather.location,
      temperature: weather.temperature,
      condition: weather.condition,
    );
  }

  Weather copyWith({String? location, double? temperature, WeatherCondition? condition}) {
    return Weather(
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
      condition: condition ?? this.condition,
    );
  }

  @override
  List<Object?> get props => [location, temperature, condition];
}
