
import 'package:neshra/features/app_settings/data/datasource/app_settings_local_data_source.dart';
import 'package:neshra/features/app_settings/domain/repository/app_settings_repository.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  final AppSettingsLocalDataSource local;

  AppSettingsRepositoryImpl(this.local);

  @override
  Future<String> getLocale() => local.getLocale();

  @override
  Future<void> setLocale(String locale) => local.setLocale(locale);
}
