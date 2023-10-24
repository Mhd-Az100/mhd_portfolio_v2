import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  //
  AnimationController? _controller;
  //
  ScrollController s = ScrollController();
  //
  List<Color> rainbowColor = [
    purpleColor,
    purpleColor,
    blueColor.withOpacity(0.3),
    blueColor.withOpacity(0.3),
    blueColor.withOpacity(0.3),
    blueColor.withOpacity(0.3),
  ];
  //
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
      value: 0,
      lowerBound: 0,
      upperBound: 80,
    )..addListener(
        () async {
          s.jumpTo((_controller?.value ?? 1) * 5);
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 120.w,
          height: 42.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ListView(
              shrinkWrap: true,
              controller: s,
              reverse: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      tileMode: TileMode.repeated,
                      transform: const GradientRotation(0.8),
                      colors: rainbowColor,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onHover: (s) {
            if (s) {
              _controller?.repeat();
            } else {
              _controller?.stop();
            }
          },
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: 118.w,
            height: 40.w,
            child: Center(
              child: Text(
                "Resume",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: whiteLight,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
