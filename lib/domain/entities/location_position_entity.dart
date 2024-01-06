// ignore_for_file: public_member_api_docs, sort_constructors_first

class LocationPositionEntity {
  final double latitude;
  final double longitude;
  final DateTime timestamp;

  LocationPositionEntity({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  @override
  String toString() =>
      'LocationPositionEntity(latitude: $latitude, longitude: $longitude, timestamp: $timestamp)';
}
