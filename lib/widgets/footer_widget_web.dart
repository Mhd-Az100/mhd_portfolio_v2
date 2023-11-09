import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Designed And Developed By",
          style: GoogleFonts.nunito(
              fontSize: 16.sp, fontWeight: FontWeight.w400, color: whiteLight),
        ),
        SizedBox(width: 5.w),
        GlowText(
          "Mohammad Al Azmeh",
          style: GoogleFonts.nunito(
              fontSize: 16.sp, fontWeight: FontWeight.w600, color: blueColor),
        )
      ],
    );
  }
}
