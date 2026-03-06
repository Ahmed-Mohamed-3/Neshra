part of 'app_settings_cubit.dart';

abstract class AppSettingsState {
  final String locale;
  const AppSettingsState(this.locale);
}

final class AppSettingsInitial extends AppSettingsState {
  const AppSettingsInitial() : super('en');
}

final class AppSettingsLocaleState extends AppSettingsState {
  const AppSettingsLocaleState(super.locale);
}