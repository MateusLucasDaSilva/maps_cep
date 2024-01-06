import 'package:maps_cep/domain/entities/either_of/either_of.dart';
import 'package:maps_cep/domain/entities/failure/failure.dart';
import 'package:maps_cep/domain/entities/location_position_entity.dart';

abstract class LocationRepository {
  Future<EitherOf<Failure, LocationPositionEntity>> getCurrentLocation();
}
