import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_meteo_api/open_meteo_api.dart';
import 'package:weather/theme/bloc/theme_bloc.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';
import 'package:weather/weather/view/weather_page.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final client = http.Client();
    final api = OpenMeteoApi(client);
    final weatherRepo = WeatherRepository(openMeteoApi: api);

    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(create: (_) => WeatherBloc(weatherRepo)),
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
      ],
      child: const WeatherAppView(),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}
