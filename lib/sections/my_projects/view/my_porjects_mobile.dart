// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/cubit/main_cubit.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets_mobile/list_indexes_scroll_mobile.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets_mobile/project_details_mobile.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets_mobile/project_mockup_mobile.dart';
import 'package:mhd_portfolio_v2/widgets/title_of_section_mobile.dart';

class MyProjectsMobile extends StatelessWidget {
  const MyProjectsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const TitleOfSectionMobile(text: "My Projects"),
        SizedBox(height: 50.w),
        BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<MainCubit>().previousProject();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  purpleColor, // Adjust the glow color and opacity
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ),
                            BoxShadow(
                              color:
                                  blueColor, // Adjust the glow color and opacity
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 17,
                          color: whiteLight,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 700),
                        switchInCurve: Curves.easeIn,
                        child: ProjectMockupWidgetMobile(
                          key: ValueKey<int>(state.currentIndexProject),
                          index: state.currentIndexProject,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<MainCubit>().nextProject();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  purpleColor, // Adjust the glow color and opacity
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ),
                            BoxShadow(
                              color:
                                  blueColor, // Adjust the glow color and opacity
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 17,
                          color: whiteLight,
                        ),
                      ),
                    ),
                  ],
                ),
                const ListIndexPojectWidgetMobile(),
                const SizedBox(height: 15),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  switchInCurve: Curves.easeIn,
                  child: ProjectDetailsWidgetMobile(
                    key: ValueKey<int>(state.currentIndexProject),
                    index: state.currentIndexProject,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
