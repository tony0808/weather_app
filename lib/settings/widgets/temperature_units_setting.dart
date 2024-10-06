import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';

class TemperatureUnitsSetting extends StatelessWidget {
  const TemperatureUnitsSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          _SettingTitle(),
          const Divider(),
          _Setting(),
        ],
      ),
    );
  }
}

class _Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (previous, current) => previous.units != current.units,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Default Metric Unit', style: TextStyle(fontSize: 18)),
              Switch(
                value: state.units.isCelsius,
                onChanged: (_) {
                  context.read<WeatherBloc>().add(WeatherToggleUnitsEvent());
                },
              )
            ],
          ),
        );
      },
    );
  }
}

class _SettingTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Temperature Unit',
      style: TextStyle(fontSize: 24),
    );
  }
}
