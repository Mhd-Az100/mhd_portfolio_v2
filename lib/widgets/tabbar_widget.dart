import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/resources/enums.dart';
import 'package:mhd_portfolio_v2/widgets/gradient_button.dart';
import 'package:mhd_portfolio_v2/widgets/tabs_button.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key, required this.controller});
  final AutoScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      TabButton(
          tabsEnum: TabsEnum.bio,
          text: "Bio",
          ontap: () {
            controller.scrollToIndex(0,
                preferPosition: AutoScrollPosition.begin);
          }),
      Container(
        color: whiteLight,
        width: 2.w,
        height: 15.w,
      ).paddingSymmetric(h: 10.w),
      TabButton(
          tabsEnum: TabsEnum.about,
          text: "About Me",
          ontap: () {
            controller.scrollToIndex(1,
                preferPosition: AutoScrollPosition.begin);
          }),
      Container(
        color: whiteLight,
        width: 2.w,
        height: 15.w,
      ).paddingSymmetric(h: 10.w),
      TabButton(
          tabsEnum: TabsEnum.services,
          text: "My Services",
          ontap: () {
            controller.scrollToIndex(2,
                preferPosition: AutoScrollPosition.begin);
          }),
      Container(
        color: whiteLight,
        width: 2.w,
        height: 15.w,
      ).paddingSymmetric(h: 10.w),
      TabButton(
          tabsEnum: TabsEnum.myprojects,
          text: "My Projects",
          ontap: () {
            controller.scrollToIndex(3,
                preferPosition: AutoScrollPosition.begin);
          }),
      SizedBox(width: 50.w),
      GradientButton(
        onPressed: () async {
          await launchUrl(Uri.parse(
              "https://drive.google.com/file/d/1MRSqc6-4Fn-ag46vFVcW4q-2Fsz9XsDO/view?usp=drive_link"));
        },
        text: "Resume",
      ),
    ]);
  }
}
