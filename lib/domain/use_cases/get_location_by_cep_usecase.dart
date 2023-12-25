import 'package:injectable/injectable.dart';
import 'package:maps_cep/domain/entities/either_of/either_of.dart';
import 'package:maps_cep/domain/entities/failure/failure.dart';
import 'package:maps_cep/domain/entities/location_entity.dart';
import 'package:maps_cep/domain/repositories/via_cep/via_cep_repository.dart';

@injectable
class GetLocationByCepUsecase {
  final ViaCepRepository _repository;

  GetLocationByCepUsecase({required ViaCepRepository repository})
      : _repository = repository;

  Future<EitherOf<Failure, LocationEntity>> call({required int cep}) =>
      _repository.getLocation(cep: cep);
}
