import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather/models/weather.dart';
import 'package:weather_repository/weather_repository.dart' hide Weather;

import '../models/model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(const WeatherState()) {
    on<WeatherRequestEvent>(_onWeatherRequest);
    on<ToggleTemperatureUnitsEvent>(_onToggleTemperatureUnits);
  }

  Future<void> _onWeatherRequest(WeatherRequestEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      final weather = await _tryFetchWeather(event.city);
      emit(
        state.copyWith(
          status: WeatherStatus.success,
          weather: weather,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  void _onToggleTemperatureUnits(ToggleTemperatureUnitsEvent event, Emitter<WeatherState> emit) {
    final units =
        (state.units == TemperatureUnits.fahreinheit) ? TemperatureUnits.celsius : TemperatureUnits.fahreinheit;

    if (state.status != WeatherStatus.success) {
      emit(state.copyWith(units: units));
    } else if (state.weather != Weather.empty) {
      emit(
        state.copyWith(
          units: units,
          weather: state.weather.copyWith(
            temperature: _convertTemperature(state.weather.temperature, units),
          ),
        ),
      );
    }
  }

  Future<Weather> _tryFetchWeather(String city) async {
    final weather = Weather.fromRepository(await _weatherRepository.getWeather(city));
    final temperature = _getTemperatureBasedOnUnits(weather.temperature);
    return weather.copyWith(temperature: temperature);
  }

  double _getTemperatureBasedOnUnits(double temperature) {
    if (state.units == TemperatureUnits.fahreinheit) {
      return _toFahrenheit(temperature);
    } else {
      return temperature;
    }
  }

  double _convertTemperature(double temperature, TemperatureUnits units) {
    return (units == TemperatureUnits.fahreinheit)
        ? _toFahrenheit(state.weather.temperature)
        : _toCelsius(state.weather.temperature);
  }

  double _toFahrenheit(double val) {
    return (val * 9 / 5) + 32;
  }

  double _toCelsius(double val) {
    return (val - 32) * 5 / 9;
  }
}
