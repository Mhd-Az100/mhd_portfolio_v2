import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/sections/my_services/model/services_mode.dart';

class ServiceCard extends StatelessWidget {
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  ServiceCard({
    Key? key,
    required this.service,
  }) : super(key: key);
  final ServiceModel service;
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        cardKey.currentState?.toggleCard();
      },
      onHover: (v) {
        if (v) {
          isHovering = true;

          Timer(const Duration(milliseconds: 500), () {
            if (isHovering) {
              cardKey.currentState?.toggleCard();
            }
          });
        } else {
          isHovering = false;
        }
      },
      child: FlipCard(
        key: cardKey,
        flipOnTouch: false,
        front: GlassmorphicContainer(
          height: 200.w,
          width: 450.w,
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
              blueColor.withOpacity(0.7),
              purpleColor.withOpacity(0.7),
            ],
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  service.imgPath ?? "",
                  height: 140.w,
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
        back: GlassmorphicContainer(
          height: 200.w,
          width: 450.w,
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
          child: Align(
            alignment: Alignment.center,
            child: Text(
              service.body ?? '',
              style: GoogleFonts.nunito(
                  height: 2,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: whiteLight),
            ),
          ).paddingSymmetric(h: 25.w, v: 15.w),
        ),
      ),
    );
  }
}
