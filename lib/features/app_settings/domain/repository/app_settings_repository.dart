abstract class AppSettingsRepository {
  Future<String> getLocale();

  Future<void> setLocale(String locale);
}
