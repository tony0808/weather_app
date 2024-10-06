import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/search/widgets/search_bar.dart';
import 'package:weather/settings/view/settings_page.dart';
import 'package:weather/theme/bloc/theme_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: state.appBarColor,
            title: const Text(
              'Search',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            centerTitle: true,
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
            child: const Padding(
              padding: EdgeInsets.only(top: 50),
              child: CitySearchBar(),
            ),
          ),
        );
      },
    );
  }
}
