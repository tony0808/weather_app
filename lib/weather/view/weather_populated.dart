import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/settings/view/settings_page.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';
import 'package:weather/weather/widgets/condition_text.dart';
import 'package:weather/weather/widgets/custom_divider.dart';
import 'package:weather/weather/widgets/temperature_text.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherPopulated extends StatelessWidget {
  final String city;
  final double temperature;
  final WeatherCondition condition;

  const WeatherPopulated({required this.city, required this.temperature, required this.condition, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 98, 98, 98),
        title: Text(
          city,
          style: const TextStyle(color: Colors.white, fontSize: 32),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.read<WeatherBloc>().add(WeatherSearchAgainEvent());
          },
          icon: const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(SettingsPage.route());
            },
            icon: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: Icon(
                Icons.settings,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 240, 0, 0),
          child: Column(
            children: [
              TemperatureText(temperature),
              const CustomDivider(),
              ConditionText(condition),
            ],
          ),
        ),
      ),
    );
  }
}
