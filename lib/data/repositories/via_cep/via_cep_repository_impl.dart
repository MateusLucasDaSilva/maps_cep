import 'package:injectable/injectable.dart';
import 'package:maps_cep/data/data_sources/via_cep/via_cep_data_source.dart';
import 'package:maps_cep/domain/entities/either_of/either_of.dart';
import 'package:maps_cep/domain/entities/failure/failure.dart';
import 'package:maps_cep/domain/entities/location_entity.dart';

import '../../../domain/repositories/via_cep/via_cep_repository.dart';

@Injectable(as: ViaCepRepository)
class ViaCepRepositoryImpl extends ViaCepRepository {
  final ViaCepDataSource _dataSource;

  ViaCepRepositoryImpl({required ViaCepDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<EitherOf<Failure, LocationEntity>> getLocation({
    required int cep,
  }) async {
    try {
      final LocationEntity result = await _dataSource.getLocation(cep: cep);
      return resolve(result);
    } catch (e) {
      return reject(GetLocationFailure());
    }
  }
}
