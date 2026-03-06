
import 'package:neshra/features/app_settings/domain/repository/app_settings_repository.dart';

class SetLocaleUseCase {
  AppSettingsRepository repository;

  SetLocaleUseCase(this.repository);

  Future<void> call(String locale) => repository.setLocale(locale);
}