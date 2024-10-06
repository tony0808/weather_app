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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return CustomAppBar(state.appBarColor);
          },
        ),
      ),
      body: const Column(
        children: [
          TemperatureUnitsSetting(),
          ColorChangeSetting(),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {

  final Color color;

  const CustomAppBar(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(color: Colors.white),
      backgroundColor: color,
      title: const Text(
        'Settings',
        style: TextStyle(color: Colors.white, fontSize: 32),
      ),
      centerTitle: true,
    );
  }
}
