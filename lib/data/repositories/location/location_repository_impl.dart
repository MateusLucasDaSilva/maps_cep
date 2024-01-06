import 'package:injectable/injectable.dart';
import 'package:maps_cep/data/data_sources/location/location_data_source.dart';
import 'package:maps_cep/data/data_sources/location/location_exceptions.dart';
import 'package:maps_cep/domain/entities/either_of/either_of.dart';
import 'package:maps_cep/domain/entities/failure/failure.dart';
import 'package:maps_cep/domain/entities/location_position_entity.dart';

import '../../../domain/repositories/location/location_repository.dart';

@Injectable(as: LocationRepository)
class LocationRepositoryImpl extends LocationRepository {
  final LocationDataSource _datasource;

  LocationRepositoryImpl({
    required LocationDataSource datasource,
  }) : _datasource = datasource;

  @override
  Future<EitherOf<Failure, LocationPositionEntity>> getCurrentLocation() async {
    try {
      final LocationPositionEntity result =
          await _datasource.getCurrentPosition();
      return resolve(result);
    } on LocationDeniedExceptions catch (e) {
      return reject(LocationDeniedFailure(message: e.message));
    } catch (e) {
      return reject(UnknownFailure());
    }
  }
}
