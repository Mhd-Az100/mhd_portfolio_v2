import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/sections/about/view/about_web.dart';
import 'package:mhd_portfolio_v2/sections/bio/views/bio_web.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/view/my_porjects_web.dart';
import 'package:mhd_portfolio_v2/sections/my_services/view/my_services_web.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: primaryColor),
        child: ListView(
          children: [
            SizedBox(height: 100.w),
            SizedBox(
              height: 900.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      top: -100.w,
                      left: -80.w,
                      child: Image.asset("assets/imgs/rock1.png")),
                  const BioWeb().paddingSymmetric(h: 50.w)
                ],
              ),
            ),
            SizedBox(
              height: 900.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      top: 100.w,
                      right: -80.w,
                      child: Image.asset("assets/imgs/rock2.png")),
                  Positioned(
                      bottom: 100.w,
                      left: -80.w,
                      child: Image.asset("assets/imgs/cube.png")),
                  const AboutWeb().paddingSymmetric(h: 50.w),
                ],
              ),
            ),
            SizedBox(
              height: 900.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      bottom: 100.w,
                      right: -20.w,
                      child: Image.asset("assets/imgs/rock2.png")),
                  Positioned(
                      top: 50.w,
                      left: 600.w,
                      child: Image.asset(
                        "assets/imgs/circle.png",
                        width: 170,
                      )),
                  Positioned(
                      bottom: 300.w,
                      left: -50.w,
                      child: Image.asset(
                        "assets/imgs/cube.png",
                        width: 250.w,
                      )),
                  const MyServicesWeb().paddingSymmetric(h: 50.w),
                ],
              ),
            ),
            SizedBox(
              height: 900.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const MyProjectsWeb().paddingSymmetric(h: 50.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
