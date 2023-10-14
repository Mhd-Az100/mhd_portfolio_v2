// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';

class StoreButton extends StatefulWidget {
  const StoreButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.txt,
  });
  final String txt;
  final Function()? onTap;
  final String icon;
  @override
  State<StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<StoreButton> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (v) {
        setState(() {
          _isHover = v;
        });
      },
      onTap: widget.onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        duration: 300.ms,
        width: 130.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(width: 1.5.w, color: whiteLight),
          boxShadow: [
            BoxShadow(
              color: whiteLight.withOpacity(
                  _isHover ? 0.7 : 0.45), // Adjust the glow color and opacity
              blurRadius: _isHover ? 15 : 8,
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              widget.icon,
              width: 20.w,
            ),
            SizedBox(width: 10.w),
            Text(
              widget.txt,
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: whiteLight),
            ),
          ],
        ),
      ),
    );
  }
}
