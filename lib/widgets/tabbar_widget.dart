import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/cubit/main_cubit.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/resources/enums.dart';
import 'package:mhd_portfolio_v2/widgets/gradient_button.dart';
import 'package:mhd_portfolio_v2/widgets/tabs_button.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
        onPressed: () {
          context.read<MainCubit>().hoverTabs(TabsEnum.resume);
        },
        text: "Resume",
      ),
    ]);
  }
}
