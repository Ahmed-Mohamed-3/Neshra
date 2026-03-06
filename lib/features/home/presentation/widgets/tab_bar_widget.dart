import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neshra/core/error/failure_localization.dart';
import 'package:neshra/core/extensions/context_extension.dart';
import 'package:neshra/features/home/presentation/cubit/home_cubit.dart';
import 'package:neshra/features/home/presentation/cubit/home_states.dart';
import 'package:neshra/features/home/presentation/widgets/news_shimmer.dart';


// class TabBarWidget extends StatelessWidget {
//   const TabBarWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeStates>(
//       buildWhen: (prev, curr) =>
//       curr is GetSourcesLoadingState||
//       curr is GetSourcesSuccessState,
//       builder: (context, state) {
//         if (state is GetSourcesLoadingState) {
//           return const NewsShimmer();
//         }
//
//         if (state is GetSourcesErrorState) {
//           return Center(child: Text(state.failure.trMessage()));
//         }
//
//         return TabBar(
//           onTap: (index) {
//             context.read<HomeCubit>().changeTab(index);
//           },
//           isScrollable: true,
//           tabs:
//               context
//                   .read<HomeCubit>()
//                   .sourceModel
//                   ?.sources
//                   ?.map(
//                     (e) => Tab(
//                       child: Text(e.name ?? "", style: context.titleMedium),
//                     ),
//                   )
//                   .toList() ??
//               [],
//         );
//       },
//     );
//   }
// }
class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (prev, curr) =>
      curr is GetSourcesLoadingState ||
          curr is GetSourcesSuccessState ||
          curr is GetSourcesErrorState,
      builder: (context, state) {
        if (state is GetSourcesLoadingState) {
          return const NewsShimmer();
        }

        if (state is GetSourcesErrorState) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(child: Text(state.failure.trMessage())),
          );
        }

        final sources = context.read<HomeCubit>().sourceModel?.sources ?? [];

        if (sources.isEmpty) {
          return const SizedBox.shrink();
        }

        return TabBar(
          onTap: (index) {
            context.read<HomeCubit>().changeTab(index);
          },
          isScrollable: true,
          tabs: sources
              .map(
                (e) => Tab(
              child: Text(e.name ?? "", style: context.titleMedium),
            ),
          )
              .toList(),
        );
      },
    );
  }
}