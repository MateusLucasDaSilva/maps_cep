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
import '../data/data_sources/via_cep/via_cep_data_source.dart' as _i5;
import '../data/data_sources/via_cep/via_cep_data_source_impl.dart' as _i6;
import '../data/repositories/via_cep/via_cep_repository_impl.dart' as _i8;
import '../domain/repositories/via_cep/via_cep_repository.dart' as _i7;
import '../domain/use_cases/get_location_by_cep_usecase.dart' as _i9;
import '../presentation/pages/home/controller/home_controller.dart' as _i10;

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
    gh.factory<_i5.ViaCepDataSource>(
        () => _i6.ViaCepDataSourceImpl(httpClient: gh<_i3.HttpClient>()));
    gh.factory<_i7.ViaCepRepository>(
        () => _i8.ViaCepRepositoryImpl(dataSource: gh<_i5.ViaCepDataSource>()));
    gh.factory<_i9.GetLocationByCepUsecase>(() =>
        _i9.GetLocationByCepUsecase(repository: gh<_i7.ViaCepRepository>()));
    gh.factory<_i10.HomeController>(() => _i10.HomeController(
        getLocationByCepUsecase: gh<_i9.GetLocationByCepUsecase>()));
    return this;
  }
}
