import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';

class GradientButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;

  const GradientButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
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
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
                width: 1.5.w,
                color: _isHovered ? Colors.transparent : whiteLight),
            gradient: LinearGradient(
              colors: _isHovered
                  ? const [
                      blueColor,
                      purpleColor,
                    ]
                  : [
                      Colors.transparent,
                      Colors.transparent,
                    ], // Adjust the button colors
              begin: _isHovered ? Alignment.centerRight : Alignment.topLeft,
              end: _isHovered ? Alignment.centerLeft : Alignment.bottomRight,
            ),
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
// MouseRegion(
//       onEnter: (event) {
//         setState(() {
//           _isHovered = true;
//         });
//       },
//       onExit: (event) {
//         setState(() {
//           _isHovered = false;
//         });
//       },
//       child: SizedBox(
//         width: 70.w,
//         child: InkWell(
//           onTap: () async {
//             await launchUrl(Uri.parse(widget.url ?? ''));
//           },
//           child: AnimatedContainer(
//             duration: 300.ms,
//             padding: EdgeInsets.all(_isHovered ? 7.w : 9.w),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                   width: 1.5.w,
//                   color: _isHovered ? Colors.transparent : whiteLight),
//               boxShadow: _isHovered
//                   ? [
//                       BoxShadow(
//                         color: Colors
//                             .blue.shade300, // Adjust the glow color and opacity
//                         blurRadius: 12,
//                         spreadRadius: 2.0,
//                       ),
//                     ]
//                   : [
//                       const BoxShadow(
//                         color: Colors
//                             .transparent, // Adjust the glow color and opacity
//                         blurRadius: 5.0,
//                         spreadRadius: 2.0,
//                       ),
//                     ],
//               gradient: LinearGradient(
//                 colors: _isHovered
//                     ? [
//                         blueColor,
//                         purpleColor,
//                       ]
//                     : [
//                         Colors.transparent,
//                         Colors.transparent,
//                       ], // Adjust the button colors
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: SizedBox(
//               width: _isHovered ? 26.w : 30.w,
//               height: _isHovered ? 26.w : 30.w,
//               child: SvgPicture.asset(
//                 widget.svgPath ?? '',
//                 fit: BoxFit.scaleDown,
//                 color: _isHovered ? whiteLight : whiteLight,
//               ),
//             ),
//           ),
//         ),
//       ),
//     )
