import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/bloc/weather_bloc.dart';

class CitySearchBar extends StatefulWidget {
  const CitySearchBar({super.key});

  static Route<String> route() {
    return MaterialPageRoute(builder: (_) => const CitySearchBar());
  }

  @override
  State<StatefulWidget> createState() {
    return _CitySearchBarState();
  }
}

class _CitySearchBarState extends State<CitySearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(255, 175, 175, 175),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Icon(Icons.search),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(
                      color: Color.fromARGB(185, 0, 0, 0),
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                      border: InputBorder.none,
                      hintText: 'Chicago',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 194, 194, 194),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () async {
              if (_controller.text.isEmpty) {
                _showErrorDialog();
                return;
              }
              context.read<WeatherBloc>().add(WeatherRequestEvent(_controller.text));
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }

  Future<void> _showErrorDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Empty Input Field'),
          content: const Text('The input that you entered has length 0.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
