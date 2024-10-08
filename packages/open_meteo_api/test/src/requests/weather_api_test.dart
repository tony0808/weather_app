import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:open_meteo_api/src/exceptions/weather_exception.dart';
import 'package:open_meteo_api/src/models/models.dart';
import 'package:open_meteo_api/src/requests/weather_api.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

class MockHttpResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('weather_api_requests', () {
    late WeatherApi weatherApi;
    late http.Client httpClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      weatherApi = WeatherApi(httpClient);
    });

    group('getWeather', () {
      
      const String lat = '42.354';
      const String lon = '65.312';

      const responseBody = '''{
                                  "current_weather" : {
                                    "temperature":20.2,
                                    "weathercode":3
                                  }
                              }''';

      test('succeeds to return weather', () async {
        final response = MockHttpResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(responseBody);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        Weather weather = await weatherApi.getWeather(lat, lon);

        expect(
          weather,
          isA<Weather>()
              .having((v) => v.temperature, 'temperature', 20.2)
              .having((v) => v.weatherCode, 'weatherCode', 3),
        );
      });

      test('fails to fetch weather', () {
        final response = MockHttpResponse();
        when(() => response.statusCode).thenReturn(400);
        when(() => response.body).thenReturn(responseBody);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        expect(() async => weatherApi.getWeather(lat, lon), throwsA(isA<WeatherRequestException>()));
      });
    });
  });
}
