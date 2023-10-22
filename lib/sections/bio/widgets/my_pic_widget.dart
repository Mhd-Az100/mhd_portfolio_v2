import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPictureWidget extends StatelessWidget {
  const MyPictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 680.w,
          height: 370.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              "assets/imgs/intro.png",
              fit: BoxFit.cover,
            ).animate(delay: 1000.ms).blurXY(
                begin: 1,
                end: 4.5,
                duration: 1200.ms,
                delay: 500.ms,
                curve: Curves.easeInOutCubic),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          top: 0,
          child: SizedBox(
            width: 340.w,
            height: 390.w,
            child: Image.asset(
              "assets/imgs/personal.png",
              scale: 0.5.w,
            )
                .animate(delay: 1000.ms)
                .fade(
                    begin: 0.3,
                    end: 1,
                    duration: 1200.ms,
                    curve: Curves.easeInOutCubic)
                .blurXY(
                    begin: 4.5,
                    end: 0,
                    duration: 1200.ms,
                    // delay: 1000.ms,
                    curve: Curves.easeInOutCubic)
                .move(
                    begin: Offset(80.w, 0.w),
                    end: Offset(180.w, -75.w),
                    curve: Curves.easeInOutCirc,
                    duration: 1200.ms,
                    delay: 300.ms),
          ),
        ),
      ],
    );
  }
}
