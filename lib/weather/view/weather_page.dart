import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/search/view/search_page.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';
import 'package:weather/weather/view/weather_failure.dart';
import 'package:weather/weather/view/weather_loading.dart';
import 'package:weather/weather/view/weather_populated.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (ctx, state) {
        switch (state.status) {
          case WeatherStatus.initial:
            return const SearchPage();
          case WeatherStatus.loading:
            return const WeatherLoading();
          case WeatherStatus.success:
            return WeatherPopulated(
              city: state.weather.location,
              temperature: state.weather.temperature,
              condition: state.weather.condition,
            );
          case WeatherStatus.failure:
            return const WeatherFailure();
        }
      },
    );
  }
}
