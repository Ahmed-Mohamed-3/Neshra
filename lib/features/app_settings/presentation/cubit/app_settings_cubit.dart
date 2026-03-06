import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neshra/features/app_settings/domain/usecases/get_locale_use_case.dart';
import 'package:neshra/features/app_settings/domain/usecases/set_locale_use_case.dart';
part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit(this.getLocaleUseCase, this.setLocaleUseCase)
    : super(AppSettingsInitial());
  SetLocaleUseCase setLocaleUseCase;
  GetLocaleUseCase getLocaleUseCase;

  void setLocale(String locale) async {
    await setLocaleUseCase.call(locale);
    emit(AppSettingsLocaleState(locale));
  }

  void getLocale() async {
    final locale = await getLocaleUseCase.call();
    emit(AppSettingsLocaleState(locale));
  }
}
