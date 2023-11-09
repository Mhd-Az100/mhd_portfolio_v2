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
        return Container(
          clipBehavior: Clip.none,
          height: 70,
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
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                context.read<MainCubit>().selectProjectIndex(index);
              },
              child: Container(
                clipBehavior: Clip.none,
                width: 25,
                height: 25,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    index == state.currentIndexProject
                        ? Positioned(
                            top: 10,
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: ImageFiltered(
                              imageFilter:
                                  ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                              child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [purpleColor, blueColor]),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: blueColor,
                                                offset: Offset(5, 3),
                                                blurRadius: 10),
                                            BoxShadow(
                                                color: purpleColor,
                                                offset: Offset(-5, -3),
                                                blurRadius: 10)
                                          ]))
                                  .animate(
                                      target: index == state.currentIndexProject
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
                ),
              ),
            ).paddingSymmetric(h: 15),
          ),
        );
      },
    );
  }
}
