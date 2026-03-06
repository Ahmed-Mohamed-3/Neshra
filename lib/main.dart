import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neshra/core/theme/dark_theme.dart';
import 'package:neshra/core/theme/light_theme.dart';
import 'package:neshra/core/theme/theme_app.dart';
import 'package:neshra/features/app_settings/presentation/cubit/app_settings_cubit.dart';
import 'package:neshra/features/splash/presentation/screens/splash_screen.dart';
import 'core/di/di.dart';
import 'core/network/network_info.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  NetworkInfo.init();
  configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      fallbackLocale: Locale('en'),
      path: 'assets/translations',
      child: BlocProvider<AppSettingsCubit>(
        create: (context) => getIt<AppSettingsCubit>(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeApp lightTheme = LightTheme();
    ThemeApp darkTheme = DarkTheme();
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: lightTheme.themeData(),
          darkTheme: darkTheme.themeData(),
          themeMode: ThemeMode.system,
          home: SplashScreen(),
        );
      },
    );
  }
}
