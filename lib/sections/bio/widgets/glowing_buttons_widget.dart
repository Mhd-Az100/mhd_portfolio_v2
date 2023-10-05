import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class GlowingButton extends StatefulWidget {
  final String? svgPath;
  final String? url;
  const GlowingButton({super.key, required this.svgPath, required this.url});
  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: SizedBox(
        width: 70.w,
        child: InkWell(
          onTap: () async {
            await launchUrl(Uri.parse(widget.url ?? ''));
          },
          child: AnimatedContainer(
            duration: 300.ms,
            padding: EdgeInsets.all(_isHovered ? 7.w : 9.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 1.5.w,
                  color: _isHovered ? Colors.transparent : whiteLight),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: Colors
                            .blue.shade300, // Adjust the glow color and opacity
                        blurRadius: 12,
                        spreadRadius: 2.0,
                      ),
                    ]
                  : [
                      const BoxShadow(
                        color: Colors
                            .transparent, // Adjust the glow color and opacity
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                      ),
                    ],
              gradient: LinearGradient(
                colors: _isHovered
                    ? [
                        blueColor,
                        purpleColor,
                      ]
                    : [
                        Colors.transparent,
                        Colors.transparent,
                      ], // Adjust the button colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SizedBox(
              width: _isHovered ? 26.w : 30.w,
              height: _isHovered ? 26.w : 30.w,
              child: SvgPicture.asset(
                widget.svgPath ?? '',
                fit: BoxFit.scaleDown,
                color: _isHovered ? whiteLight : whiteLight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
