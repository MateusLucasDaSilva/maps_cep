// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:maps_cep/domain/entities/either_of/either_of.dart';
import 'package:maps_cep/domain/entities/failure/failure.dart';
import 'package:maps_cep/domain/entities/location_entity.dart';
import 'package:maps_cep/domain/use_cases/get_location_by_cep_usecase.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@injectable
class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final GetLocationByCepUsecase _getLocationByCepUsecase;
  HomeControllerBase({
    required GetLocationByCepUsecase getLocationByCepUsecase,
  }) : _getLocationByCepUsecase = getLocationByCepUsecase;

  @observable
  LocationEntity? location;

  void _setLocation(LocationEntity localCalled) => location = localCalled;

  @action
  Future<void> getLocation(int cep) async {
    final EitherOf<Failure, LocationEntity> result =
        await _getLocationByCepUsecase(cep: cep);

    result.get((Failure reject) => null, _setLocation);
  }
}
