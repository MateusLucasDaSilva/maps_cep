abstract class Failure {
  final String? message;

  const Failure({this.message});
}

class GetLocationFailure implements Failure {
  @override
  String? get message => 'Ocorreu um Erro ao Buscar a Localização';
}
