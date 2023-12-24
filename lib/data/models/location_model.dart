import 'package:maps_cep/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    required super.cep,
    required super.logradouro,
    required super.complemento,
    required super.bairro,
    required super.uf,
    required super.ibge,
    required super.gia,
    required super.ddd,
    required super.siafi,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      bairro: json['bairro'],
      uf: json['uf'],
      ibge: json['ibge'],
      gia: json['gia'],
      ddd: json['ddd'],
      siafi: json['siafi'],
    );
  }

  LocationEntity toEntity() => LocationEntity(
        cep: cep,
        logradouro: logradouro,
        complemento: complemento,
        bairro: bairro,
        uf: uf,
        ibge: ibge,
        gia: gia,
        ddd: ddd,
        siafi: siafi,
      );
}
