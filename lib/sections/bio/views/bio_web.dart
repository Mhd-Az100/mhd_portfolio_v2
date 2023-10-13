import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/sections/bio/widgets/glass_card_info_widget.dart';
import 'package:mhd_portfolio_v2/sections/bio/widgets/my_pic_widget.dart';

class BioWeb extends StatefulWidget {
  const BioWeb({Key? key}) : super(key: key);

  @override
  State<BioWeb> createState() => _BioWebState();
}

class _BioWebState extends State<BioWeb> {
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
            top: -200.w,
            left: -120.w,
            child: Image.asset(
              "assets/imgs/rock1.png",
              width: 300.w,
            ),
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
            child: const InfoCard().animate().slideX(
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
