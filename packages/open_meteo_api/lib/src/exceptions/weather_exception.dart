sealed class WeatherException implements Exception {}

class WeatherRequestException extends WeatherException {}

class LocationRequestException extends WeatherException {}