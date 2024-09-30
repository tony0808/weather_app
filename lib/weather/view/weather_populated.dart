import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';
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
            onPressed: () {},
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
          padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: Column(
            children: [
              _TemperatureText(temperature),
              _CustomDivider(),
              _ConditionText(condition),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 340,
      color: const Color.fromARGB(255, 98, 98, 98),
    );
  }
}

class _ConditionText extends StatelessWidget {
  final WeatherCondition condition;

  const _ConditionText(this.condition);

  @override
  Widget build(BuildContext context) {
    return Text(
      capitalize(condition.name.toString()),
      style: const TextStyle(
        fontSize: 96,
        color: Color.fromARGB(255, 98, 98, 98),
      ),
    );
  }

  String capitalize(String str) {
    return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
  }
}

class _TemperatureText extends StatelessWidget {
  final double temperature;

  const _TemperatureText(this.temperature);

  @override
  Widget build(BuildContext context) {
    return Text(
      temperature.toString(),
      style: const TextStyle(
        fontSize: 96,
        color: Color.fromARGB(255, 98, 98, 98),
      ),
    );
  }
}
