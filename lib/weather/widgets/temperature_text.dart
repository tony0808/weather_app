import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';

class TemperatureText extends StatelessWidget {
  final double temperature;

  const TemperatureText(this.temperature, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        String degreeSign = state.units.isCelsius ? '\u2103' : '\u2109';
        return Text(
          '${temperature.toInt().toString()} $degreeSign',
          style: const TextStyle(
            fontSize: 64,
            color: Color.fromARGB(255, 98, 98, 98),
          ),
        );
      },
    );
  }
}
