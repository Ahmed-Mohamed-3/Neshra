import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:neshra/core/di/di.dart';
import 'package:neshra/features/home/data/models/news_model.dart';
import 'package:neshra/features/home/data/models/source_model.dart';
import 'package:neshra/features/home/presentation/cubit/home_cubit.dart';
import 'package:neshra/features/home/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _initApp());
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SourceModelAdapter());
    Hive.registerAdapter(SourcesAdapter());
    Hive.registerAdapter(NewsModelAdapter());
    Hive.registerAdapter(ArticlesAdapter());
  }

  Future<void> _initApp() async {
    await _initHive();

    _controller.duration = const Duration(seconds: 3);
    await _controller.forward();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider<HomeCubit>(
          create: (context) => getIt<HomeCubit>(),
          child: const HomeScreen(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 400.h,
              width: 200.w,
              child: Lottie.asset(
                "assets/lottie/splash_animation.json",
                fit: BoxFit.contain,
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
