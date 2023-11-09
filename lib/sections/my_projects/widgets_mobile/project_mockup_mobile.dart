// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/resources/projects_list.dart';

class ProjectMockupWidgetMobile extends StatelessWidget {
  const ProjectMockupWidgetMobile({
    required this.index,
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 300.w,
          child: Image.asset("assets/imgs/background.png", fit: BoxFit.cover),
        ),
        Positioned(
          top: 0.h,
          bottom: 75.h,
          child: Image.asset(
            width: 300.w,
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
    );
  }
}
