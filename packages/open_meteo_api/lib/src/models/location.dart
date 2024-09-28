class Location {
  final double latitude;
  final double longitude;

  const Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['results'][0]['latitude'],
      longitude: json['results'][0]['longitude'],
    );
  }
}
