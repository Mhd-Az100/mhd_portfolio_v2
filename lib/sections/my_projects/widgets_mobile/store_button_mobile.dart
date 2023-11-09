// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';

class StoreButtonMobile extends StatefulWidget {
  const StoreButtonMobile({
    super.key,
    required this.icon,
    required this.onTap,
    required this.txt,
  });
  final String txt;
  final Function()? onTap;
  final String icon;
  @override
  State<StoreButtonMobile> createState() => _StoreButtonMobileState();
}

class _StoreButtonMobileState extends State<StoreButtonMobile> {
  bool _isBlinking = false;

// Declare a Timer object
  Timer? _blinkingTimer;

  void toggleBlinking() {
    setState(() {
      _isBlinking = !_isBlinking;
    });

    // Start the timer and repeat the function every 2 seconds
    _blinkingTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!mounted) {
        // Check if the widget is still mounted before updating the state
        timer.cancel(); // Cancel the timer
        return;
      }
      setState(() {
        _isBlinking = !_isBlinking;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    toggleBlinking();
  }

  @override
  void dispose() {
    // Cancel the blinking timer when the widget is disposed
    _blinkingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        duration: 300.ms,
        width: 90.w,
        height: 25.w,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(width: 1.5.w, color: whiteLight),
          boxShadow: [
            BoxShadow(
              color: whiteLight.withOpacity(_isBlinking
                  ? 0.7
                  : 0.45), // Adjust the glow color and opacity
              blurRadius: _isBlinking ? 15 : 8,
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              widget.icon,
              width: 12.w,
            ),
            SizedBox(width: 10.w),
            Text(
              widget.txt,
              style: GoogleFonts.nunito(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w400,
                  color: whiteLight),
            ),
          ],
        ),
      ),
    );
  }
}
