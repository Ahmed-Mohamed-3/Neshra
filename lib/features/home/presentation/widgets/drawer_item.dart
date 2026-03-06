import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neshra/core/extention/context_extention.dart';
import 'package:neshra/features/home/presentation/cubit/home_cubit.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.onClickDrawer});

  final Function onClickDrawer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 24.h,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 65),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(context.tr("app_name"), style: context.titleLarge),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 24.h,
              children: [
                GestureDetector(
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      Text(
                        context.tr("go_to_home"),
                        style: context.bodyLarge?.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => onClickDrawer(),
                ),
                Divider(),
                Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.language,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    Text(
                      context.tr("language"),
                      style: context.bodyLarge?.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ],
                ),
                DropdownMenu(
                  width: MediaQuery.of(context).size.width * .55,
                  textStyle: context.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  initialSelection: context.locale.languageCode == "en" ? 1 : 2,
                  onSelected: (value) async {
                    if (value == null) return;
                    final navigator = Navigator.of(context);
                    final cubit = context.read<HomeCubit>();
                    if (value == 1) {
                      await context.setLocale(const Locale('en'));
                      cubit.setLocal("en");
                    } else {
                      await context.setLocale(const Locale('ar'));
                      cubit.setLocal("ar");
                    }

                    navigator.pop();
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 1, label: context.tr("english")),
                    DropdownMenuEntry(value: 2, label: context.tr("arabic")),
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
