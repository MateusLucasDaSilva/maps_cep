// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocationDeniedExceptions implements Exception {
  final String message;
  LocationDeniedExceptions({
    this.message = 'Permissão desabilitada !',
  });
}
