import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButtonMobile extends StatefulWidget {
  final String? svgPath;
  final String? url;
  const ContactButtonMobile(
      {super.key, required this.svgPath, required this.url});
  @override
  _ContactButtonState createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButtonMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35.w,
      child: InkWell(
        onTap: () async {
          await launchUrl(Uri.parse(widget.url ?? ''));
        },
        child: AnimatedContainer(
          duration: 300.ms,
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1.w, color: whiteLight),
            boxShadow: const [
              BoxShadow(
                color: Colors.transparent, // Adjust the glow color and opacity
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: SizedBox(
            width: 20.w,
            height: 20.h,
            child: SvgPicture.asset(
              widget.svgPath ?? '',
              fit: BoxFit.scaleDown,
              color: whiteLight,
            ),
          ),
        ),
      ),
    );
  }
}
