// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/clients/http/http_client.dart' as _i3;
import '../data/clients/http/http_client_impl.dart' as _i4;
import '../data/data_sources/location/location_data_source.dart' as _i5;
import '../data/data_sources/location/location_data_source_impl.dart' as _i6;
import '../data/data_sources/via_cep/via_cep_data_source.dart' as _i9;
import '../data/data_sources/via_cep/via_cep_data_source_impl.dart' as _i10;
import '../data/repositories/location/location_repository_impl.dart' as _i8;
import '../data/repositories/via_cep/via_cep_repository_impl.dart' as _i12;
import '../domain/repositories/location/location_repository.dart' as _i7;
import '../domain/repositories/via_cep/via_cep_repository.dart' as _i11;
import '../domain/use_cases/get_current_location_usecase.dart' as _i13;
import '../domain/use_cases/get_location_by_cep_usecase.dart' as _i14;
import '../presentation/pages/home/controller/home_controller.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.HttpClient>(() => _i4.HttpClientImpl());
    gh.factory<_i5.LocationDataSource>(() => _i6.LocationDataSourceImpl());
    gh.factory<_i7.LocationRepository>(() =>
        _i8.LocationRepositoryImpl(datasource: gh<_i5.LocationDataSource>()));
    gh.factory<_i9.ViaCepDataSource>(
        () => _i10.ViaCepDataSourceImpl(httpClient: gh<_i3.HttpClient>()));
    gh.factory<_i11.ViaCepRepository>(() =>
        _i12.ViaCepRepositoryImpl(dataSource: gh<_i9.ViaCepDataSource>()));
    gh.factory<_i13.GetCurrentLocationUsecase>(() =>
        _i13.GetCurrentLocationUsecase(
            repository: gh<_i7.LocationRepository>()));
    gh.factory<_i14.GetLocationByCepUsecase>(() =>
        _i14.GetLocationByCepUsecase(repository: gh<_i11.ViaCepRepository>()));
    gh.factory<_i15.HomeController>(() => _i15.HomeController(
          getLocationByCepUsecase: gh<_i14.GetLocationByCepUsecase>(),
          getCurrentLocationUsecase: gh<_i13.GetCurrentLocationUsecase>(),
        ));
    return this;
  }
}
