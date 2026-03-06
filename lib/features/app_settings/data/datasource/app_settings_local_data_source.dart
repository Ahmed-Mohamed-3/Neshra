import 'package:injectable/injectable.dart';
import 'package:neshra/core/cashing/hive_keys.dart';
import 'package:neshra/core/cashing/stores.dart';

@injectable
class AppSettingsLocalDataSource {
  final AppSettingsStore store;
  AppSettingsLocalDataSource(this.store);

  Future<String> getLocale() async {
    return (await store.read(HiveKeys.locale)) ?? 'en';
  }

  Future<void> setLocale(String locale) async {
    await store.write(HiveKeys.locale, locale);
  }
}
