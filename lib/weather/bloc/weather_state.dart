part of 'weather_bloc.dart';

enum WeatherStatus { initial, loading, success, failure }

final class WeatherState extends Equatable {
  final Weather weather;
  final WeatherStatus status;
  final TemperatureUnits units;

  const WeatherState({
    this.status = WeatherStatus.initial,
    this.weather = Weather.empty,
    this.units = TemperatureUnits.celsius,
  });

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    TemperatureUnits? units,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      units: units ?? this.units,
    );
  }

  @override
  List<Object> get props => [status, weather, units];
}
