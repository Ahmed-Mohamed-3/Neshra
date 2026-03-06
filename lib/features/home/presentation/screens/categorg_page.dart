import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:neshra/core/extention/context_extention.dart';
class CategoryPage extends StatelessWidget {
  CategoryPage({super.key, required this.onClick});

  final List<String> categoryName = [
    "general",
    "business",
    "sports",
    "health",
    "entertainment",
    "technology",
    "science",
  ];
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16.h,
        children: [
          Text(
            context.tr("good_morning"),
            style: context.titleLarge?.copyWith(fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Stack(
                    alignment: index.isEven
                        ? AlignmentDirectional.bottomEnd
                        : AlignmentDirectional.bottomStart,
                    children: [
                      Image.asset("assets/images/${categoryName[index]}.png"),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(84.r),
                          color: Color(0xffFFFFFF).withAlpha(50),
                        ),
                        child: GestureDetector(
                          onTap: ()=> onClick(categoryName[index]),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              index.isEven ? SizedBox(width: 16.w) : SizedBox(),
                              Visibility(
                                visible: index.isEven,
                                child: Text(
                                  context.tr("view_all"),
                                  style: context.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                width: 54.w,
                                height: 54.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(84.r),
                                  color: Color(0xffFFFFFF),
                                ),
                                child: index.isEven
                                    ? Icon(Icons.arrow_forward_ios)
                                    : Icon(Icons.arrow_back_ios),
                              ),
                              Visibility(
                                visible: index.isOdd,
                                child: Text(
                                  context.tr("view_all"),
                                  style: context.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              index.isOdd ? SizedBox(width: 16.w) : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: categoryName.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 16.h);
              },
            ),
          ),
        ],
      ),
    );
  }
}
