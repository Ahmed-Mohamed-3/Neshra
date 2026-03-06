import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neshra/core/error/failure_localization.dart';
import 'package:neshra/core/extention/context_extention.dart';
import 'package:neshra/features/home/presentation/cubit/home_cubit.dart';
import 'package:neshra/features/home/presentation/cubit/home_states.dart';
import 'package:neshra/features/home/presentation/screens/categorg_page.dart';
import 'package:neshra/features/home/presentation/screens/news_page.dart';
import 'package:neshra/features/home/presentation/widgets/drawer_item.dart';
import 'package:neshra/features/home/presentation/widgets/news_shimmer.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        if (cubit.categoryClick != true) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              title: Text(context.tr("home"), style: context.titleLarge),
            ),
            drawer: DrawerItem(
              onClickDrawer: () {
                cubit.setCategoryClick(null);
                cubit.setCategoryName(null);
                Navigator.pop(context);
              },
            ),
            body: CategoryPage(
              onClick: (category) {
                cubit.setCategoryClick(true);
                cubit.setCategoryName(category);
                cubit.currentIndex = 0;
                cubit.getSources(category);
              },
            ),
          );
        }

        final tabsLength = cubit.sourceModel?.sources?.length ?? 0;

        return DefaultTabController(
          length: tabsLength == 0 ? 1 : tabsLength,
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              title: Text(
                context.tr(cubit.categoryName ?? "home"),
                style: context.titleLarge,
              ),
            ),
            drawer: DrawerItem(
              onClickDrawer: () {
                cubit.setCategoryClick(null);
                cubit.setCategoryName(null);
                Navigator.pop(context);
              },
            ),
            body: Builder(
              builder: (_) {
                if (state is GetSourcesLoadingState) {
                  return const NewsShimmer();
                }
                if (state is GetSourcesErrorState) {
                  return Center(child: Text(state.failure.trMessage()));
                }
                return const NewsPage();
              },
            ),
          ),
        );
      },
    );
  }
}
