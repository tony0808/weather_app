import 'package:flutter_test/flutter_test.dart';
import 'package:open_meteo_api/src/models/models.dart';

void main() {
  test('fromJson', () {
    Map<String, dynamic> json = {
      'current_weather': {
        'temperature': 20.2,
        'weathercode': 3,
      }
    };

    expect(
      Weather.fromJson(json),
      isA<Weather>()
          .having((v) => v.temperature, 'temperature', 20.2)
          .having((v) => v.weatherCode, 'weathercode', 3),
    );
  });
}
