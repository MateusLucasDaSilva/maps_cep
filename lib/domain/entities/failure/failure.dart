abstract class Failure {
  final String? message;

  const Failure({this.message});
}

class UnknownFailure extends Failure {
  UnknownFailure({super.message = 'Ocorreu um erro inesperado!'});
}

class LocationDeniedFailure extends Failure {
  LocationDeniedFailure({super.message});
}

class GetLocationFailure implements Failure {
  @override
  String? get message => 'Ocorreu um Erro ao Buscar a Localização';
}
