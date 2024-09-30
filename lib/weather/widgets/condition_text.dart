
import 'package:flutter/material.dart';
import 'package:weather_repository/weather_repository.dart';

class ConditionText extends StatelessWidget {
  final WeatherCondition condition;

  const ConditionText(this.condition, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      capitalize(condition.name.toString()),
      style: const TextStyle(
        fontSize: 64,
        color: Color.fromARGB(255, 98, 98, 98),
      ),
    );
  }

  String capitalize(String str) {
    return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
  }
}