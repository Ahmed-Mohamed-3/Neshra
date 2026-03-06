import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neshra/core/error/failure_localization.dart';
import 'package:neshra/core/extensions/context_extension.dart';
import 'package:neshra/features/home/presentation/cubit/home_cubit.dart';
import 'package:neshra/features/home/presentation/cubit/home_states.dart';
import 'package:neshra/features/home/presentation/widgets/card_item.dart';
import 'package:neshra/features/home/presentation/widgets/news_shimmer.dart';
import 'package:neshra/features/home/presentation/widgets/tab_bar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TabBarWidget(),
        Expanded(
          child: BlocBuilder<HomeCubit, HomeStates>(
            buildWhen: (prev, curr) =>
                curr is GetNewsLoadingState ||
                curr is GetNewsSuccessState ||
                curr is GetNewsErrorState,
            builder: (context, state) {
              final cubit = context.read<HomeCubit>();

              if (state is GetNewsLoadingState) {
                return const NewsShimmer();
              }

              if (state is GetNewsErrorState) {
                return Center(child: Text(state.failure.trMessage()));
              }

              final articles = cubit.newsModel?.articles ?? [];
              if (articles.isEmpty) {
                return Center(child: Text(context.tr("status")));
              }

              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              side: BorderSide(
                                width: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                spacing: 8.h,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.network(
                                      articles[index].urlToImage ?? "",
                                      fit: BoxFit.cover,
                                      height: 180.h,
                                      width: double.infinity,
                                    ),
                                  ),
                                  Text(
                                    articles[index].content ??
                                        "Not contains description",
                                    style: context.bodyMedium?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).scaffoldBackgroundColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _launchUrl(articles[index].url ?? "");
                                      },
                                      child: Text(
                                        context.tr("view_full_article"),
                                        style: context.bodyMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: CardItem(article: articles[index]),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
