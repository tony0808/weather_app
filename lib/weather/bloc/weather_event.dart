part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherRequestEvent extends WeatherEvent {
  final String city;

  const WeatherRequestEvent(this.city);
}

class ToggleTemperatureUnitsEvent extends WeatherEvent {}

