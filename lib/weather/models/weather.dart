import 'package:equatable/equatable.dart';
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

  @override
  List<Object?> get props => [location, temperature, condition];
}
