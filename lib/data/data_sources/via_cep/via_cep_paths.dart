mixin ViaCepPaths {
  String locationPath(int cep) => 'https://viacep.com.br/ws/$cep/json/';
}
