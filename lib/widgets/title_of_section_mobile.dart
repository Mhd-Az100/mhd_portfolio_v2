import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';

class TitleOfSectionMobile extends StatelessWidget {
  const TitleOfSectionMobile({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 2.w,
          decoration: BoxDecoration(
              color: blueColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 70.r,
                    color: purpleColor.withOpacity(0.5),
                    spreadRadius: 5.w),
                BoxShadow(
                    blurRadius: 20,
                    color: blueColor.withOpacity(0.5),
                    spreadRadius: 2),
                BoxShadow(
                    blurRadius: 100.r,
                    offset: Offset(120.w, 0),
                    color: blueColor.withOpacity(0.4),
                    spreadRadius: 3),
                BoxShadow(
                    blurRadius: 100.r,
                    offset: Offset(-20.w, 0),
                    color: blueColor.withOpacity(0.4),
                    spreadRadius: 3.w),
              ],
              borderRadius: BorderRadius.circular(12.r)),
        ).animate().fadeIn(duration: 1000.ms, curve: Curves.easeInQuad)),
        Center(
          child: GlowText(
            glowColor: blueColor.withOpacity(0.5),
            blurRadius: 15,
            "“$text”",
            style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: whiteLight),
          ),
        ).paddingSymmetric(h: 5.w),
        Expanded(
            child: Container(
          height: 2.w,
          decoration: BoxDecoration(
              color: blueColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 70.r,
                    color: purpleColor.withOpacity(0.5),
                    spreadRadius: 5.w),
                BoxShadow(
                    blurRadius: 20,
                    color: blueColor.withOpacity(0.5),
                    spreadRadius: 2),
                BoxShadow(
                    blurRadius: 100.r,
                    offset: Offset(20.w, 0),
                    color: blueColor.withOpacity(0.4),
                    spreadRadius: 3),
                BoxShadow(
                    blurRadius: 100.r,
                    offset: Offset(-120.w, 0),
                    color: blueColor.withOpacity(0.4),
                    spreadRadius: 3.w),
              ],
              borderRadius: BorderRadius.circular(12.r)),
        ).animate().fadeIn(duration: 1000.ms, curve: Curves.easeInQuad)),
      ],
    ).paddingSymmetric(h: 8.w);
  }
}
