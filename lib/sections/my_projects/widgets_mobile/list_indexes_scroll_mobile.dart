// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/cubit/main_cubit.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/resources/projects_list.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ListIndexPojectWidgetMobile extends StatefulWidget {
  const ListIndexPojectWidgetMobile({
    super.key,
  });

  @override
  State<ListIndexPojectWidgetMobile> createState() =>
      _ListIndexPojectWidgetMobileState();
}

class _ListIndexPojectWidgetMobileState
    extends State<ListIndexPojectWidgetMobile> {
  @override
  void initState() {
    super.initState();
    context.read<MainCubit>().projectIndexScrollController =
        ItemScrollController();
    context.read<MainCubit>().projectIndexPositionsListener =
        ItemPositionsListener.create();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return SizedBox(
          height: 70.w,
          width: double.infinity * 0.8,
          child: ScrollablePositionedList.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemScrollController:
                context.read<MainCubit>().projectIndexScrollController,
            itemPositionsListener:
                context.read<MainCubit>().projectIndexPositionsListener,
            shrinkWrap: true,
            itemCount: MyProjectsList.myProjects.length,
            itemBuilder: (context, index) => Row(
              children: [
                InkWell(
                  onTap: () {
                    context.read<MainCubit>().selectProjectIndex(index);
                  },
                  child: SizedBox(
                    width: 50.w,
                    height: 50.w,
                    child: Stack(
                      children: [
                        index == state.currentIndexProject
                            ? Positioned(
                                top: 10.w,
                                bottom: 10.w,
                                left: 0.w,
                                right: 0.w,
                                child: ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                      sigmaX: 12.w, sigmaY: 12.w),
                                  child: Container(
                                          height: 25.w,
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                              gradient:
                                                  const LinearGradient(colors: [
                                                purpleColor,
                                                blueColor
                                              ]),
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: blueColor,
                                                    offset: Offset(5.w, 3.w),
                                                    blurRadius: 20),
                                                BoxShadow(
                                                    color: purpleColor,
                                                    offset: Offset(-5.w, -3.w),
                                                    blurRadius: 20.w)
                                              ]))
                                      .animate(
                                          target:
                                              index == state.currentIndexProject
                                                  ? 1
                                                  : 0)
                                      .fadeIn(
                                          duration: 500.ms,
                                          curve: Curves.easeInCubic),
                                ),
                              )
                            : const Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: SizedBox.shrink()),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text((index + 1).toString(),
                                style: GoogleFonts.nunito(
                                    fontSize: 12.sp,
                                    color: index == state.currentIndexProject
                                        ? whiteLight
                                        : purpleColor)),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(h: 20),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
