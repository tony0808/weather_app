import 'package:flutter/material.dart';
import 'package:weather/search/widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 98, 98, 98),
          title: const Text(
            'Search',
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          centerTitle: true,
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
          child: const Padding(
            padding: EdgeInsets.only(top: 50),
            child: CitySearchBar(),
          ),
        ));
  }
}
