import 'package:flutter/material.dart';
import 'package:weather/settings/widgets/temperature_units_setting.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Route<String> route() {
    return MaterialPageRoute(builder: (_) => const SettingsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 98, 98, 98),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        centerTitle: true,
      ),
      body: const Column(children: [TemperatureUnitsSetting()],)
    );
  }
}
