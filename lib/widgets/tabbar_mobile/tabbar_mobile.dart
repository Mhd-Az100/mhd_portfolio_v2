import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/resources/enums.dart';
import 'package:mhd_portfolio_v2/widgets/resume_button_mobile.dart';
import 'package:mhd_portfolio_v2/widgets/tabbar_mobile/tabs_button_mobile.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

class TabBarMobile extends StatelessWidget {
  const TabBarMobile({super.key, required this.controller});
  final AutoScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      TabButtonMobile(
          tabsEnum: TabsEnum.bio,
          text: "Bio",
          ontap: () {
            controller.animateTo(0, curve: Curves.easeInOut, duration: 500.ms);
          }),
      Container(
        color: whiteLight,
        width: 1.w,
        height: 9.w,
      ).paddingSymmetric(h: 5.w),
      TabButtonMobile(
          tabsEnum: TabsEnum.about,
          text: "About Me",
          ontap: () {
            controller.animateTo(900.w,
                curve: Curves.easeInOut, duration: 500.ms);
          }),
      Container(
        color: whiteLight,
        width: 1.w,
        height: 9.w,
      ).paddingSymmetric(h: 5.w),
      TabButtonMobile(
          tabsEnum: TabsEnum.services,
          text: "My Services",
          ontap: () {
            controller.animateTo(1800.w,
                curve: Curves.easeInOut, duration: 500.ms);
          }),
      Container(
        color: whiteLight,
        width: 1.w,
        height: 9.w,
      ).paddingSymmetric(h: 5.w),
      TabButtonMobile(
          tabsEnum: TabsEnum.myprojects,
          text: "My Projects",
          ontap: () {
            controller.animateTo(2700.w,
                curve: Curves.easeInOut, duration: 500.ms);
          }),
      SizedBox(width: 20.w),
      ResumeButtonMobile(
        onPressed: () async {
          await launchUrl(Uri.parse(
              "https://drive.google.com/file/d/1MRSqc6-4Fn-ag46vFVcW4q-2Fsz9XsDO/view?usp=drive_link"));
        },
        text: "Resume",
      ),
    ]);
  }
}
