import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/sections/bio/widgets_web/glass_card_info_web.dart';
import 'package:mhd_portfolio_v2/sections/bio/widgets_web/my_pic_widget.dart';

class BioWeb extends StatelessWidget {
  const BioWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 150.w),
      height: MediaQuery.of(context).size.height.w,
      width: MediaQuery.of(context).size.width.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0.w,
            left: 30.w,
            child: SizedBox(
              width: 300.w,
              child: Image.asset(
                fit: BoxFit.cover,
                "assets/imgs/rock1.png",
              ),
            ),
          )
              .animate(
                onPlay: (controller) => controller.repeat(reverse: true),
              )
              .move(
                end: Offset(-140.w, -200.w),
                begin: Offset(-140.w, -150.w),
                curve: Curves.easeInOutSine,
                duration: 8.seconds,
              ),
          Positioned(
            right: 40.w,
            child: const MyPictureWidget()
                .animate()
                .slideX(
                  begin: 4,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: 1.2.seconds,
                )
                .fade(
                  duration: 1.5.seconds,
                  curve: Curves.fastLinearToSlowEaseIn,
                ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.05.w,
            top: -75.w,
            child: const InfoCardWeb().animate().slideX(
                  begin: -4,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: 1.2.seconds,
                ),
          ),
        ],
      ),
    );
  }
}
