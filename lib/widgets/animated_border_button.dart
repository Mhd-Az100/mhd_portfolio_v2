import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';

class RainbowButton extends StatefulWidget {
  const RainbowButton({super.key});

  @override
  RainbowButtonState createState() => RainbowButtonState();
}

class RainbowButtonState extends State<RainbowButton>
    with TickerProviderStateMixin {
  //
  AnimationController? _controller;
  //
  ScrollController s = ScrollController();
  //
  List<Color> rainbowColor = [purpleColor, blueColor];
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
          width: 120,
          height: 50,
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
                      colors: [
                        ...rainbowColor,
                        ...rainbowColor,
                        ...rainbowColor,
                      ],
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
            width: 100,
            height: 40,
            child: Center(
              child: Text(
                "Obada Alhalabi",
                style: GoogleFonts.kalam(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
