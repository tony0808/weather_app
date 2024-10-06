import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/settings/widgets/color_change_setting.dart';
import 'package:weather/settings/widgets/temperature_units_setting.dart';
import 'package:weather/theme/bloc/theme_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Route<String> route() {
    return MaterialPageRoute(builder: (_) => const SettingsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: const BackButton(color: Colors.white),
            backgroundColor: state.appBarColor,
            title: const Text(
              'Settings',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            centerTitle: true,
          ),
          body: const Column(
            children: [
              TemperatureUnitsSetting(),
              ColorChangeSetting(),
            ],
          ),
        );
      },
    );
  }
}
