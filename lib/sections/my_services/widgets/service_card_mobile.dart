import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/sections/my_services/model/services_mode.dart';

// ignore: must_be_immutable
class ServiceCardMobile extends StatefulWidget {
  const ServiceCardMobile({
    Key? key,
    required this.service,
  }) : super(key: key);
  final ServiceModel service;

  @override
  State<ServiceCardMobile> createState() => _ServiceCardMobileState();
}

class _ServiceCardMobileState extends State<ServiceCardMobile>
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
              if ((cardKey.currentState!.isFront)) {
                startAnimation();
              } else {
                stopAnimation();
              }
            },
            child: FlipCard(
              key: cardKey,
              flipOnTouch: false,
              front: GlassmorphicContainer(
                height: 100.w,
                width: double.infinity,
                borderRadius: 8.r,
                blur: 20,
                alignment: Alignment.bottomCenter,
                border: 1.2.w,
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
                        height: 65.w,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.info_outline,
                        color: whiteLight,
                        size: 20,
                      ),
                    ),
                    SizedBox(height: 10.w),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        widget.service.title ?? '',
                        style: GoogleFonts.nunito(
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            color: whiteLight),
                      ),
                    )
                  ],
                ).paddingSymmetric(h: 10.w, v: 5.w),
              ),
              back: GlassmorphicContainer(
                height: 100.w,
                width: double.infinity,
                borderRadius: 8.r,
                blur: 20,
                alignment: Alignment.bottomCenter,
                border: 1.2.w,
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
                        height: 1.4,
                        fontWeight: FontWeight.w500,
                        fontSize: 8.sp,
                        color: whiteLight),
                  ),
                ).paddingSymmetric(h: 10.w, v: 5.w),
              ),
            ),
          );
        });
  }
}
