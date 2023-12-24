import 'package:maps_cep/data/clients/http/http_client.dart';
import 'package:maps_cep/data/data_sources/via_cep/via_cep_paths.dart';
import 'package:maps_cep/data/models/location_model.dart';
import 'package:maps_cep/domain/entities/location_entity.dart';
import 'package:maps_cep/domain/entities/response_entity.dart';

import './via_cep_data_source.dart';

class ViaCepDataSourceImpl extends ViaCepDataSource with ViaCepPaths {
  final HttpClient _httpClient;

  ViaCepDataSourceImpl({required HttpClient httpClient})
      : _httpClient = httpClient;

  @override
  Future<LocationEntity> getLocation({required int cep}) async {
    final String path = locationPath(cep);
    final ResponseEntity response = await _httpClient.get(path);
    if (response.statusCode == 200) {
      return LocationModel.fromJson(response.body).toEntity();
    }
    throw Exception();
  }
}
