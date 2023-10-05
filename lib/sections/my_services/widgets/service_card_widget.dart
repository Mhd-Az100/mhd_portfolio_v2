import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/sections/my_services/model/services_mode.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.service,
  }) : super(key: key);
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        //left

        // BoxShadow(
        //     blurRadius: 20.r,
        //     offset: Offset(-2.w, 0),
        //     color: blueColor.withOpacity(0.4),
        //     spreadRadius: 1),
        // //right

        // BoxShadow(
        //     blurRadius: 20.r,
        //     offset: Offset(2.w, 0),
        //     color: purpleColor.withOpacity(0.4),
        //     spreadRadius: 1.w),
        //
        //======inner Shadow============
        //
        //left
        // BoxShadow(
        //     blurRadius: 20.r,
        //     offset: Offset(2.w, 0),
        //     color: blueColor.withOpacity(0.4),
        //     spreadRadius: 1),
        // //right
        // BoxShadow(
        //     blurRadius: 20.r,
        //     offset: Offset(-2.w, 0),
        //     color: purpleColor.withOpacity(0.4),
        //     spreadRadius: 1.w),
      ]),
      child: GlassmorphicContainer(
        height: 235.w,
        width: 475.w,
        borderRadius: 12.r,
        blur: 20,
        alignment: Alignment.bottomCenter,
        border: 1.8.w,
        linearGradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(49, 57, 83, 117),
              Color.fromARGB(70, 68, 76, 87),
            ],
            stops: [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            blueColor.withOpacity(0.5),
            purpleColor.withOpacity(0.5),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                service.imgPath ?? "",
                height: 170.w,
              ),
            ),
            SizedBox(height: 10.w),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                service.title ?? '',
                style: GoogleFonts.nunito(
                    height: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                    color: whiteLight),
              ),
            )
          ],
        ).paddingSymmetric(h: 25.w, v: 15.w),
      ),
    );
  }
}
