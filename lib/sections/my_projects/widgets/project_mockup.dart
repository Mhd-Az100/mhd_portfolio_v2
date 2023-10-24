// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/cubit/main_cubit.dart';
import 'package:mhd_portfolio_v2/resources/projects_list.dart';

class ProjectMockupWidget extends StatelessWidget {
  const ProjectMockupWidget({
    required this.index,
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<MainCubit>().nextProject();
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: 550.w,
            child: Image.asset("assets/imgs/background.png", fit: BoxFit.cover),
          ),
          Positioned(
            top: 0.w,
            bottom: 50.w,
            left: 20.w,
            right: 20.w,
            child: Image.asset(
              MyProjectsList.myProjects[index].imagePath ?? '',
            ),
          )
              .animate(
                onPlay: (controller) => controller.repeat(reverse: true),
              )
              .move(
                begin: Offset(0.w, 0.w),
                end: Offset(0.w, 10.w),
                curve: Curves.easeInOutSine,
                duration: 10.seconds,
              )
        ],
      ),
    );
  }
}
