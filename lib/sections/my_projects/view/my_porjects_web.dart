// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/cubit/main_cubit.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets_web/list_indexes_scroll_web.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets_web/project_details_web.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets_web/project_mockup_web.dart';
import 'package:mhd_portfolio_v2/widgets/title_of_section_web.dart';

class MyProjectsWeb extends StatelessWidget {
  const MyProjectsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 30.w),
        const TitleOfSectionWeb(text: "My Projects"),
        SizedBox(height: 50.w),
        BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListIndexPojectWidgetWeb(),
                ),
                Expanded(
                    flex: 5,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 700),
                      // reverseDuration: const Duration(milliseconds: 500),
                      switchInCurve: Curves.easeIn,
                      // layoutBuilder: (currentChild, previousChildren) {
                      //   return Stack(
                      //     children: <Widget>[
                      //       ...previousChildren,
                      //       if (currentChild != null) currentChild,
                      //     ],
                      //   );
                      // },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        key: ValueKey<int>(state.currentIndexProject),
                        children: [
                          Expanded(
                            child: ProjectDetailsWidgetWeb(
                              index: state.currentIndexProject,
                            ),
                          ),
                          Expanded(
                            child: ProjectMockupWidgetWeb(
                              index: state.currentIndexProject,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            );
          },
        ),
      ],
    );
  }
}
