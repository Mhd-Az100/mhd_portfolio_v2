import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/sections/my_services/model/services_mode.dart';

// ignore: must_be_immutable
class ServiceCardWeb extends StatefulWidget {
  const ServiceCardWeb({
    Key? key,
    required this.service,
  }) : super(key: key);
  final ServiceModel service;

  @override
  State<ServiceCardWeb> createState() => _ServiceCardWebState();
}

class _ServiceCardWebState extends State<ServiceCardWeb>
    with TickerProviderStateMixin {
  final Duration rotationDuration = const Duration(seconds: 1);
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: rotationDuration,
    );
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  void startAnimation() {
    animationController?.repeat();
  }

  void stopAnimation() {
    animationController?.reset();
  }

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  bool isHovering = false;
  Timer? hoverTimer;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) {
          final double rotationAngle =
              animationController!.value * 360 * 3.14159265359 / 180;
          return InkWell(
            onTap: () {
              cardKey.currentState?.toggleCard();
            },
            onHover: (v) {
              hoverTimer?.cancel();
              if (v) {
                isHovering = true;
                startAnimation();
                hoverTimer = Timer(const Duration(milliseconds: 300), () {
                  if (isHovering && cardKey.currentState!.isFront) {
                    cardKey.currentState?.toggleCard();
                  }
                });
              } else {
                isHovering = false;
                hoverTimer = Timer(const Duration(milliseconds: 200), () {
                  if (!(cardKey.currentState!.isFront)) {
                    cardKey.currentState?.toggleCard();
                  }
                });
                stopAnimation();
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
                  transform: GradientRotation(rotationAngle),
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    blueColor.withOpacity(0.2),
                    purpleColor,
                  ],
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        widget.service.imgPath ?? "",
                        height: 140.w,
                      ),
                    )
                        .animate(
                          target: isHovering ? 1 : 0,
                        )
                        .shimmer(duration: 1.seconds) // shimmer +

                    ,
                    SizedBox(height: 10.w),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        widget.service.title ?? '',
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
                  transform: GradientRotation(rotationAngle),
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    blueColor.withOpacity(0.1),
                    blueColor.withOpacity(0.2),
                    blueColor.withOpacity(0.3),
                    purpleColor,
                  ],
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.service.body ?? '',
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
        });
  }
}
