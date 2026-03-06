// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/app_settings/data/datasource/app_settings_local_data_source.dart'
    as _i795;
import '../../features/home/data/data_sourse/local/home_local_ds.dart' as _i64;
import '../../features/home/data/data_sourse/remote/home_remote_ds.dart'
    as _i735;
import '../../features/home/data/data_sourse/remote/home_remote_ds_impl.dart'
    as _i471;
import '../../features/home/data/repository/home_repo_impl.dart' as _i1013;
import '../../features/home/domain/repository/home_repo.dart' as _i396;
import '../../features/home/domain/use_cases/get_news_use_case.dart' as _i177;
import '../../features/home/domain/use_cases/get_sources_use_case.dart'
    as _i130;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../cashing/stores.dart' as _i677;
import '../network/api_manager.dart' as _i310;
import '../network/network_info.dart' as _i932;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i310.ApiManager>(() => _i310.ApiManager());
    gh.lazySingleton<_i677.AppSettingsStore>(() => _i677.AppSettingsStore());
    gh.lazySingleton<_i677.SourcesStore>(() => _i677.SourcesStore());
    gh.lazySingleton<_i677.NewsStore>(() => _i677.NewsStore());
    gh.lazySingleton<_i932.NetworkInfo>(() => _i932.NetworkInfo());
    gh.factory<_i64.HomeLocalDs>(() => _i64.HomeLocalDs(
          gh<_i677.SourcesStore>(),
          gh<_i677.NewsStore>(),
        ));
    gh.factory<_i795.AppSettingsLocalDataSource>(
        () => _i795.AppSettingsLocalDataSource(gh<_i677.AppSettingsStore>()));
    gh.factory<_i735.HomeRemoteDs>(
        () => _i471.HomeRemoteDSImpl(gh<_i310.ApiManager>()));
    gh.lazySingleton<_i396.HomeRepo>(() => _i1013.HomeRepoImpl(
          gh<_i735.HomeRemoteDs>(),
          gh<_i64.HomeLocalDs>(),
          gh<_i932.NetworkInfo>(),
        ));
    gh.factory<_i177.GetNewsUseCase>(
        () => _i177.GetNewsUseCase(gh<_i396.HomeRepo>()));
    gh.factory<_i130.GetSourcesUseCase>(
        () => _i130.GetSourcesUseCase(gh<_i396.HomeRepo>()));
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(
          gh<_i130.GetSourcesUseCase>(),
          gh<_i177.GetNewsUseCase>(),
        ));
    return this;
  }
}
