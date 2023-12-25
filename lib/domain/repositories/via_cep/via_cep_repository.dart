import 'package:maps_cep/domain/entities/either_of/either_of.dart';
import 'package:maps_cep/domain/entities/failure/failure.dart';
import 'package:maps_cep/domain/entities/location_entity.dart';

abstract class ViaCepRepository {
  Future<EitherOf<Failure, LocationEntity>> getLocation({required int cep});
}
