import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class NewsShimmer extends StatelessWidget {
  const NewsShimmer({super.key});

  final int itemCount=3;

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey.shade300;
    final highlightColor = Colors.grey.shade100;

    return ListView.separated(
      padding: EdgeInsets.all(16.r),
      itemCount: itemCount,
      separatorBuilder: (_, _) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 14.h, width: double.infinity, color: Colors.white),
                SizedBox(height: 8.h),
                Container(height: 14.h, width: 220.w, color: Colors.white),
                SizedBox(height: 8.h),
                Container(height: 14.h, width: 160.w, color: Colors.white),
              ],
            ),
          ),
        );
      },
    );
  }
}