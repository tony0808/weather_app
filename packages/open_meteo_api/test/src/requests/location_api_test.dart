import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:open_meteo_api/src/exceptions/weather_exception.dart';
import 'package:open_meteo_api/src/models/location.dart';
import 'package:open_meteo_api/src/requests/location_api.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockHttpResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('location api requests', () {
    late LocationApi locationApi;
    late http.Client httpClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      locationApi = LocationApi(httpClient);
    });

    group('getLocation', () {
      const String city = 'chicago';

      const responseBody = '''{
              "results" : [
                  {
                    "latitude" : 12.34,
                    "longitude" : 56.78
                  }
              ]
      }''';

      test('succeeds to return location', () async {
        final response = MockHttpResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(responseBody);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        Location location = await locationApi.getLocation(city);

        expect(
          location,
          isA<Location>().having((v) => v.latitude, 'latitude', 12.34).having((v) => v.longitude, 'longitude', 56.78),
        );
      });

      test('fails to fetch location', () {
        final response = MockHttpResponse();
        when(() => response.statusCode).thenReturn(400);
        when(() => response.body).thenReturn(responseBody);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        expect(() async => locationApi.getLocation(city), throwsA(isA<LocationRequestException>()));
      });
    });
  });
}
