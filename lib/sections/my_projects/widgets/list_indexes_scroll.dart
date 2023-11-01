// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/cubit/main_cubit.dart';
import 'package:mhd_portfolio_v2/resources/projects_list.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ListIndexPojectWidget extends StatelessWidget {
  const ListIndexPojectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return SizedBox(
          height: 400.w,
          width: 80.w,
          child: ScrollablePositionedList.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemScrollController:
                  context.read<MainCubit>().projectIndexScrollController,
              itemPositionsListener:
                  context.read<MainCubit>().projectIndexPositionsListener,
              shrinkWrap: true,
              itemCount: MyProjectsList.myProjects.length,
              itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<MainCubit>().selectProjectIndex(index);
                        },
                        child: SizedBox(
                          width: 100.w,
                          height: 100.w,
                          child: Stack(
                            children: [
                              index == state.currentIndexProject
                                  ? Positioned(
                                      top: 10.w,
                                      bottom: 10.w,
                                      left: 27.w,
                                      right: 27.w,
                                      child: ImageFiltered(
                                        imageFilter: ImageFilter.blur(
                                            sigmaX: 12.w, sigmaY: 12.w),
                                        child: Container(
                                                height: 50.w,
                                                width: 50.w,
                                                decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                            colors: [
                                                          purpleColor,
                                                          blueColor
                                                        ]),
                                                    shape: BoxShape.circle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: blueColor,
                                                          offset:
                                                              Offset(5.w, 3.w),
                                                          blurRadius: 20),
                                                      BoxShadow(
                                                          color: purpleColor,
                                                          offset: Offset(
                                                              -5.w, -3.w),
                                                          blurRadius: 20.w)
                                                    ]))
                                            .animate(
                                                target: index ==
                                                        state
                                                            .currentIndexProject
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
                                          fontSize: 30.sp,
                                          color:
                                              index == state.currentIndexProject
                                                  ? whiteLight
                                                  : purpleColor)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
        );
      },
    );
  }
}
