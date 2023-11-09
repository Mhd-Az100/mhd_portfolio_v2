import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';

class ResumeButtonMobile extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;

  const ResumeButtonMobile({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  _ResumeButtonMobileState createState() => _ResumeButtonMobileState();
}

class _ResumeButtonMobileState extends State<ResumeButtonMobile> {
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
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: 700.ms,
        curve: Curves.ease,
        padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 10.w),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: _isBlinking
              ? [
                  BoxShadow(
                    color: Colors.blue.shade300
                        .withOpacity(0.7), // Adjust the glow color and opacity
                    blurRadius: 15,
                    offset: const Offset(-2, -1),
                  ),
                  BoxShadow(
                    color: Colors.purple.shade300
                        .withOpacity(0.5), // Adjust the glow color and opacity
                    offset: const Offset(2, 1),
                    blurRadius: 15,
                  ),
                ]
              : [
                  const BoxShadow(
                    color:
                        Colors.transparent, // Adjust the glow color and opacity
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ],
          border: Border.all(
              width: 1.w, color: _isBlinking ? primaryColor : whiteLight),
        ),
        child: Text(
          widget.text,
          style: GoogleFonts.nunito(
              fontSize: 12.sp, fontWeight: FontWeight.w500, color: whiteLight),
        ),
      ),
    );
  }
}
