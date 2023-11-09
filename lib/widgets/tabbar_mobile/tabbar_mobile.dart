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
          ontap: () async {
            await controller.scrollToIndex(0,
                duration: 500.ms, preferPosition: AutoScrollPosition.begin);
          }),
      Container(
        color: whiteLight,
        width: 1.w,
        height: 9.w,
      ).paddingSymmetric(h: 5.w),
      TabButtonMobile(
          tabsEnum: TabsEnum.about,
          text: "About Me",
          ontap: () async {
            await controller.scrollToIndex(1,
                duration: 500.ms, preferPosition: AutoScrollPosition.begin);
          }),
      Container(
        color: whiteLight,
        width: 1.w,
        height: 9.w,
      ).paddingSymmetric(h: 5.w),
      TabButtonMobile(
          tabsEnum: TabsEnum.services,
          text: "My Services",
          ontap: () async {
            await controller.scrollToIndex(2,
                duration: 500.ms, preferPosition: AutoScrollPosition.begin);
          }),
      Container(
        color: whiteLight,
        width: 1.w,
        height: 9.w,
      ).paddingSymmetric(h: 5.w),
      TabButtonMobile(
          tabsEnum: TabsEnum.myprojects,
          text: "My Projects",
          ontap: () async {
            await controller.scrollToIndex(3,
                duration: 500.ms, preferPosition: AutoScrollPosition.begin);
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
