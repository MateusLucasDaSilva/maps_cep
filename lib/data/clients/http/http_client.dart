import 'package:maps_cep/domain/entities/response_entity.dart';

abstract class HttpClient {
  Future<ResponseEntity> get(String path);
  Future<ResponseEntity> post(String path, {Map<String, dynamic>? data});
}
