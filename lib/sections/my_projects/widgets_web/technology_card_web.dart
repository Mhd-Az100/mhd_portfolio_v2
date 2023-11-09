import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';

class TechnologyCardWeb extends StatelessWidget {
  const TechnologyCardWeb({
    required this.txt,
    super.key,
  });
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: blueColor),
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              txt,
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  color: blueColor,
                  fontWeight: FontWeight.w400),
            ),
          ).paddingSymmetric(h: 10.w, v: 3.w),
        ],
      ),
    );
  }
}
