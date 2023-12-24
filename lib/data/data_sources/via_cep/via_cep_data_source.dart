import 'package:maps_cep/domain/entities/location_entity.dart';

abstract class ViaCepDataSource {
  Future<LocationEntity> getLocation({required int cep});
}
