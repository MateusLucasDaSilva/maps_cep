import 'package:injectable/injectable.dart';
import 'package:maps_cep/domain/entities/either_of/either_of.dart';
import 'package:maps_cep/domain/entities/failure/failure.dart';
import 'package:maps_cep/domain/entities/location_position_entity.dart';
import 'package:maps_cep/domain/repositories/location/location_repository.dart';

@injectable
class GetCurrentLocationUsecase {
  final LocationRepository _repository;
  GetCurrentLocationUsecase({
    required LocationRepository repository,
  }) : _repository = repository;

  Future<EitherOf<Failure, LocationPositionEntity>> call() {
    return _repository.getCurrentLocation();
  }
}
