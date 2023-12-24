// ignore_for_file: public_member_api_docs, sort_constructors_first

class LocationEntity {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String uf;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;
  LocationEntity({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });
}
