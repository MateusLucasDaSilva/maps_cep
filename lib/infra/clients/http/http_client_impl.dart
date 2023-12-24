import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maps_cep/domain/entities/response_entity.dart';

import './http_client.dart';

@Injectable(as: HttpClient)
class HttpClientImpl extends HttpClient {
  final Dio _dio = Dio();

  @override
  Future<ResponseEntity> get(String path) async {
    final Response<dynamic> response = await _dio.get(
      path,
    );
    return ResponseEntity(
      statusCode: response.statusCode,
      body: response.data,
    );
  }

  @override
  Future<ResponseEntity> post(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    final Response<dynamic> response = await _dio.post(
      path,
      data: data,
    );

    return ResponseEntity(
      statusCode: response.statusCode,
      body: response.data,
    );
  }
}
