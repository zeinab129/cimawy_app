import 'dart:ui';

import 'package:cimawy/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static var movieNameStyle = GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: AppColors.whiteColor);

  static var movieDateStyle = GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 10.sp,
      color: AppColors.movieDateColor);

  static var recMovieDateStyle = GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 8.sp,
      color: AppColors.movieDateColor);

  static var viewMovieStyle = GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 13.sp,
      color: AppColors.secondTextColor);

  static var genTitleStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
      color: AppColors.whiteColor);
}
