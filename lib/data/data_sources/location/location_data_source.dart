import 'package:maps_cep/domain/entities/location_position_entity.dart';

abstract class LocationDataSource {
  Future<LocationPositionEntity> getCurrentPosition();
}
