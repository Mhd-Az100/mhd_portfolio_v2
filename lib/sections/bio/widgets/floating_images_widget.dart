import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';

class FloatingImages extends StatelessWidget {
  const FloatingImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // decoration: BoxDecoration(
      // shape: BoxShape.circle,
      // color: Colors.amber,
      // image: DecorationImage(
      //     image: AssetImage("assets/imgs/s.png"), fit: BoxFit.contain),
      // ),
      width: MediaQuery.of(context).size.width * 0.4.w,
      height: MediaQuery.of(context).size.height * 0.4.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: 90.w,
              left: 110.w,
              child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: blueColor,
                        blurRadius: 8,
                      )
                    ],
                    shape: BoxShape.circle,
                    border: Border.all(color: blueColor, width: 1.w),
                    color: primaryColor,
                  ),
                  width: 70.w,
                  height: 70.w,
                  child: Image.asset(
                    "assets/imgs/float1.png",
                    fit: BoxFit.contain,
                  ))),
          Positioned(
              top: 90.w,
              right: 110.w,
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: blueColor,
                      blurRadius: 8,
                    )
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(color: blueColor, width: 1.w),
                  color: primaryColor,
                ),
                width: 70.w,
                height: 70.w,
                child: Image.asset(
                  "assets/imgs/float2.png",
                  fit: BoxFit.contain,
                ),
              )),
          Positioned(
              bottom: -15.w,
              left: 170.w,
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: blueColor,
                      blurRadius: 8,
                    )
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(color: blueColor, width: 1.w),
                  color: primaryColor,
                ),
                width: 70.w,
                height: 70.w,
                child: Image.asset(
                  "assets/imgs/float4.png",
                  fit: BoxFit.contain,
                ),
              )),
          Positioned(
              bottom: -15.w,
              right: 170.w,
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: blueColor,
                      blurRadius: 8,
                    )
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(color: blueColor, width: 1.w),
                  color: primaryColor,
                ),
                width: 70.w,
                height: 70.w,
                child: Image.asset(
                  "assets/imgs/float5.png",
                  fit: BoxFit.contain,
                ),
              )),
          Positioned(
              top: -25.w,
              right: 175.w,
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: blueColor,
                      blurRadius: 8,
                    )
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(color: blueColor, width: 1.w),
                  color: primaryColor,
                ),
                width: 70.w,
                height: 70.w,
                child: Image.asset(
                  "assets/imgs/float6.png",
                  fit: BoxFit.contain,
                ),
              )),
          Positioned(
              top: -25.w,
              left: 175.w,
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: blueColor,
                      blurRadius: 8,
                    )
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(color: blueColor, width: 1.w),
                  color: primaryColor,
                ),
                width: 70.w,
                height: 70.w,
                child: Image.asset(
                  "assets/imgs/float3.png",
                  fit: BoxFit.contain,
                ),
              )),
        ],
      ),
    )
        .animate(
          // autoPlay: false,
          onComplete: (c) => c.repeat(),
        )
        .rotate(duration: 25.seconds);
  }
}
