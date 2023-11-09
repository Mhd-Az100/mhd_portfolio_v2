import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/resources/enums.dart';
import 'package:mhd_portfolio_v2/widgets/resume_button_web.dart';
import 'package:mhd_portfolio_v2/widgets/tabbar_web/tabs_button_web.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

class TabBarWeb extends StatelessWidget {
  const TabBarWeb({super.key, required this.controller});
  final AutoScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      TabButtonWeb(
          tabsEnum: TabsEnum.bio,
          text: "Bio",
          ontap: () async {
            await controller.scrollToIndex(0,
                duration: 500.ms, preferPosition: AutoScrollPosition.begin);
          }),
      Container(
        color: whiteLight,
        width: 2.w,
        height: 15.w,
      ).paddingSymmetric(h: 10.w),
      TabButtonWeb(
          tabsEnum: TabsEnum.about,
          text: "About Me",
          ontap: () async {
            await controller.scrollToIndex(1,
                duration: 500.ms, preferPosition: AutoScrollPosition.begin);
          }),
      Container(
        color: whiteLight,
        width: 2.w,
        height: 15.w,
      ).paddingSymmetric(h: 10.w),
      TabButtonWeb(
          tabsEnum: TabsEnum.services,
          text: "My Services",
          ontap: () async {
            await controller.scrollToIndex(2,
                duration: 500.ms, preferPosition: AutoScrollPosition.begin);
          }),
      Container(
        color: whiteLight,
        width: 2.w,
        height: 15.w,
      ).paddingSymmetric(h: 10.w),
      TabButtonWeb(
          tabsEnum: TabsEnum.myprojects,
          text: "My Projects",
          ontap: () async {
            await controller.scrollToIndex(3,
                duration: 500.ms, preferPosition: AutoScrollPosition.begin);
          }),
      SizedBox(width: 50.w),
      ResumeButtonWeb(
        onPressed: () async {
          await launchUrl(Uri.parse(
              "https://drive.google.com/file/d/1MRSqc6-4Fn-ag46vFVcW4q-2Fsz9XsDO/view?usp=drive_link"));
        },
        text: "Resume",
      ),
    ]);
  }
}
