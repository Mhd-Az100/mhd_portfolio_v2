import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';

class ResumeButtonWeb extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;

  const ResumeButtonWeb({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  _ResumeButtonWebState createState() => _ResumeButtonWebState();
}

class _ResumeButtonWebState extends State<ResumeButtonWeb> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (isHovered) {
        setState(() {
          _isHovered = isHovered;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: _isHovered
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
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
          padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 20.w),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
                width: 1.w, color: _isHovered ? primaryColor : whiteLight),
          ),
          child: Text(
            widget.text,
            style: GoogleFonts.nunito(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: whiteLight),
          ),
        ),
      ),
    );
  }
}
