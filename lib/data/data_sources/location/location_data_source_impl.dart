import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:maps_cep/data/data_sources/location/location_exceptions.dart';
import 'package:maps_cep/domain/entities/location_position_entity.dart';

import './location_data_source.dart';

@Injectable(as: LocationDataSource)
class LocationDataSourceImpl extends LocationDataSource {
  @override
  Future<LocationPositionEntity> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationDeniedExceptions(
          message: 'Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationDeniedExceptions(
            message: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationDeniedExceptions(
          message:
              'Location permissions are permanently denied, we cannot request permissions.');
    }

    final Position position = await Geolocator.getCurrentPosition();
    return LocationPositionEntity(
      latitude: position.latitude,
      longitude: position.longitude,
      timestamp: position.timestamp,
    );
  }
}
