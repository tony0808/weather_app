import 'package:flutter_test/flutter_test.dart';
import 'package:open_meteo_api/src/models/models.dart';

void main() {
  test('fromJson', () {
    Map<String, dynamic> json = {
      'results': [
        {
          'latitude': 12.34,
          'longitude': 56.78,
        }
      ]
    };

    expect(
      Location.fromJson(json),
      isA<Location>().having((v) => v.latitude, 'latitude', 12.34)
      .having((v) => v.longitude, 'longitude', 56.78),
    );
  });
}
