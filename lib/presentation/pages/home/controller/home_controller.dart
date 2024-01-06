// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:maps_cep/domain/entities/either_of/either_of.dart';
import 'package:maps_cep/domain/entities/failure/failure.dart';
import 'package:maps_cep/domain/entities/location_entity.dart';
import 'package:maps_cep/domain/entities/location_position_entity.dart';
import 'package:maps_cep/domain/use_cases/get_current_location_usecase.dart';
import 'package:maps_cep/domain/use_cases/get_location_by_cep_usecase.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@injectable
class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final GetLocationByCepUsecase _getLocationByCepUsecase;
  final GetCurrentLocationUsecase _getCurrentLocationUsecase;
  HomeControllerBase(
      {required GetLocationByCepUsecase getLocationByCepUsecase,
      required GetCurrentLocationUsecase getCurrentLocationUsecase})
      : _getLocationByCepUsecase = getLocationByCepUsecase,
        _getCurrentLocationUsecase = getCurrentLocationUsecase;

  @observable
  LocationEntity? location;

  @observable
  String currentLocation = '';

  void _setLocation(LocationEntity localCalled) => location = localCalled;

  @action
  Future<void> getLocation(int cep) async {
    final EitherOf<Failure, LocationEntity> result =
        await _getLocationByCepUsecase(cep: cep);

    result.get((Failure reject) => null, _setLocation);
  }

  @action
  Future<void> getCurrentLocation() async {
    final EitherOf<Failure, LocationPositionEntity> result =
        await _getCurrentLocationUsecase();

    result.get(
      (Failure reject) {
        currentLocation = reject.message ?? '';
      },
      (LocationPositionEntity resolve) {
        currentLocation = resolve.toString();
      },
    );
  }
}
