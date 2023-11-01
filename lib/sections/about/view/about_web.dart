// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/resources/content_texts.dart';
import 'package:mhd_portfolio_v2/widgets/title_of_section.dart';

class AboutWeb extends StatelessWidget {
  const AboutWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.w),
        const TitleOfSection(text: "About Me"),
        SizedBox(height: 70.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.justify,
              ContentText.aboutTech,
              style: GoogleFonts.nunito(
                  height: 2,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  color: whiteLight),
            ),
            SizedBox(height: 20.w),
            GlowText(
              glowColor: Colors.white,
              blurRadius: 15,
              ContentText.personality,
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.sp,
                  color: whiteLight),
            ),
            SizedBox(height: 20.w),
            Text(
              textAlign: TextAlign.justify,
              ContentText.aboutPersonality,
              style: GoogleFonts.nunito(
                  height: 2,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  color: whiteLight),
            )
          ],
        )
            .paddingSymmetric(h: 130.w)
            .animate()
            .fadeIn(duration: 500.ms, curve: Curves.easeIn),
      ],
    );
  }
}
