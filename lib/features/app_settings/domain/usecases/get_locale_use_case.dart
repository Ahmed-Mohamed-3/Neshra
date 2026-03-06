
import 'package:neshra/features/app_settings/domain/repository/app_settings_repository.dart';

class GetLocaleUseCase {
  AppSettingsRepository repository;

  GetLocaleUseCase(this.repository);

  Future<String> call() => repository.getLocale();
}
