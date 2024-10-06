import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:weather/theme/bloc/theme_bloc.dart';

class AppBarColorChangeSeting extends StatelessWidget {
  const AppBarColorChangeSeting({super.key});

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
    return BlocBuilder<ThemeBloc, ThemeState>(
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('AppBar Color', style: TextStyle(fontSize: 18)),
              OutlinedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  backgroundColor: Colors.white
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Pick a Color'),
                        content: ColorPicker(
                          pickerColor: state.appBarColor,
                          onColorChanged: (color) {
                            context.read<ThemeBloc>().add(ThemeChangeAppBarColorEvent(color));
                          },
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Got it'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Change', style: TextStyle(fontSize: 16),),
              ),
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
      'Color Change',
      style: TextStyle(fontSize: 24),
    );
  }
}
