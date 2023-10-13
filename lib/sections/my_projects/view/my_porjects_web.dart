// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/cubit/main_cubit.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/resources/projects_list.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets/readmore_widget.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets/technology_card.dart';
import 'package:mhd_portfolio_v2/widgets/title_of_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjectsWeb extends StatelessWidget {
  const MyProjectsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const TitleOfSection(text: "My Projects"),
        SizedBox(height: 50.w),
        BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  child: ListIndexPojectWidget(),
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
                            child: ProjectDetailsWidget(
                              index: state.currentIndexProject,
                            ),
                          ),
                          Expanded(
                            child: ProjectMockupWidget(
                              index: state.currentIndexProject,
                            ),
                          ),
                        ],
                      ),
                    )
                    // .animate(
                    //   target: !state.fadeProject ? 1 : 0,
                    //   onComplete: (controller) =>
                    //       context.read<MainCubit>().fadeProject(false),
                    // )
                    // .fadeIn(duration: 500.ms, curve: Curves.easeIn),
                    ),
              ],
            );
          },
        ),
      ],
    );
  }
}

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
                  context.read<MainCubit>().itemScrollController,
              itemPositionsListener:
                  context.read<MainCubit>().itemPositionsListener,
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
          Image.asset(
            "assets/imgs/background.png",
            width: 600.w,
          ),
          Positioned(
            top: 0.w,
            bottom: 50.w,
            left: 20.w,
            right: 20.w,
            child: Image.asset(
              MyProjectsList.myProjects[index].image ?? '',
            ),
          )
        ],
      ),
    );
  }
}

class ProjectDetailsWidget extends StatelessWidget {
  const ProjectDetailsWidget({
    required this.index,
    super.key,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            context.read<MainCubit>().previousProject();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                MyProjectsList.myProjects[index].title ?? '',
                style: GoogleFonts.nunito(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                    color: whiteLight),
              ),
              Text(
                "#${MyProjectsList.myProjects[index].workingType}",
                style: GoogleFonts.nunito(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: whiteLight),
              ),
              Text(
                "#Where the project operates: ${MyProjectsList.myProjects[index].workingPlace}",
                style: GoogleFonts.nunito(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: whiteLight),
              ),
              SizedBox(height: 10.w),
              Wrap(
                children: MyProjectsList.myProjects[index].technology
                        ?.map((e) => TechnologyCard(txt: e)
                            .paddingSymmetric(h: 5.w, v: 5.w))
                        .toList() ??
                    [],
              ),
              SizedBox(height: 30.w),
              ReadMoreText(
                text: MyProjectsList.myProjects[index].desciption ?? '',
                textStyle: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  color: whiteLight,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.w),
        Visibility(
          visible: (MyProjectsList.myProjects[index].googlplayLink?.isEmpty ??
                  true) &&
              (MyProjectsList.myProjects[index].appStoreLink?.isEmpty ?? true),
          child: InProgressCard(index: index),
        ),
        Row(
          children: [
            Visibility(
              visible:
                  (MyProjectsList.myProjects[index].googlplayLink?.isNotEmpty ??
                      false),
              child: StoreButton(
                icon: "assets/svg/play.svg",
                txt: "Google Play",
                onTap: () async {
                  await launchUrl(Uri.parse(
                      MyProjectsList.myProjects[index].googlplayLink ?? ''));
                },
              ),
            ),
            SizedBox(width: 10.w),
            Visibility(
              visible:
                  (MyProjectsList.myProjects[index].appStoreLink?.isNotEmpty ??
                      false),
              child: StoreButton(
                icon: "assets/svg/apple.svg",
                txt: "Play Store",
                onTap: () async {
                  await launchUrl(Uri.parse(
                      MyProjectsList.myProjects[index].appStoreLink ?? ''));
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

class InProgressCard extends StatelessWidget {
  const InProgressCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(width: 1.5.w, color: whiteLight),
        boxShadow: [
          BoxShadow(
            color: whiteLight
                .withOpacity(0.7), // Adjust the glow color and opacity
            blurRadius: 8,
          ),
        ],
      ),
      child: Center(
        child: Text(
          (MyProjectsList.myProjects[index].private == true)
              ? "Private App"
              : "In progress",
          style: GoogleFonts.nunito(
              fontSize: 14.sp, fontWeight: FontWeight.w400, color: whiteLight),
        ),
      ),
    );
  }
}

class StoreButton extends StatefulWidget {
  const StoreButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.txt,
  });
  final String txt;
  final Function()? onTap;
  final String icon;
  @override
  State<StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<StoreButton> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (v) {
        setState(() {
          _isHover = v;
        });
      },
      onTap: widget.onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        duration: 300.ms,
        width: 130.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(width: 1.5.w, color: whiteLight),
          boxShadow: [
            BoxShadow(
              color: whiteLight.withOpacity(
                  _isHover ? 0.7 : 0.45), // Adjust the glow color and opacity
              blurRadius: _isHover ? 15 : 8,
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              widget.icon,
              width: 20.w,
            ),
            SizedBox(width: 10.w),
            Text(
              widget.txt,
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: whiteLight),
            ),
          ],
        ),
      ),
    );
  }
}
