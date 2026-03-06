import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neshra/core/theme/theme_app.dart';

class LightTheme implements ThemeApp {
  @override
  Color get backgroundColor => Color(0xffFFFFFF);

  @override
  Color get primaryColor => Color(0xff171717);

  @override
  Color get labelColor => Color(0xffA0A0A0);

  @override
  ThemeData themeData() => ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        color: primaryColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.inter(
        color: primaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.inter(
        color: primaryColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.inter(
        color: primaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: GoogleFonts.inter(
        color: labelColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
    ),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: backgroundColor,
      foregroundColor: primaryColor,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        foregroundColor: primaryColor,
        backgroundColor: backgroundColor,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    ),
    iconTheme: IconThemeData(color: primaryColor, size: 20),

    dividerTheme: DividerThemeData(color: backgroundColor),
    tabBarTheme: TabBarThemeData(
      indicatorColor: primaryColor,
      dividerColor: Colors.transparent,
      labelColor: primaryColor,
      tabAlignment: TabAlignment.start,
      unselectedLabelColor: primaryColor.withAlpha(45),
    ),
  );
}
