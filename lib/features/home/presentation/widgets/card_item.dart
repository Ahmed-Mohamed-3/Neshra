import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neshra/core/extensions/context_extension.dart';
import 'package:neshra/features/home/data/models/news_model.dart';
import 'package:shimmer/shimmer.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.article});

  final Articles? article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 220.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                article?.urlToImage ?? "",
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Icon(Icons.broken_image),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 220.h,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(article?.title ?? "", style: context.titleMedium),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        article?.author ?? "Unknown",
                        style: context.labelMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      article!.publishedAt!.substring(0, 10),
                      style: context.labelMedium,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
