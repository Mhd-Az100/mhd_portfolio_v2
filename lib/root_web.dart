// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/cubit/main_cubit.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/sections/about/view/about_web.dart';
import 'package:mhd_portfolio_v2/sections/bio/views/bio_web.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/view/my_porjects_web.dart';
import 'package:mhd_portfolio_v2/sections/my_services/view/my_services_web.dart';
import 'package:mhd_portfolio_v2/utils/responsive.dart';
import 'package:mhd_portfolio_v2/widgets/footer_widget_web.dart';
import 'package:mhd_portfolio_v2/widgets/random_move_widget.dart';
import 'package:mhd_portfolio_v2/widgets/tabbar_web/tabbar_web.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class RootScreenWeb extends StatefulWidget {
  const RootScreenWeb({super.key});

  @override
  State<RootScreenWeb> createState() => _RootScreenWebState();
}

class _RootScreenWebState extends State<RootScreenWeb> {
  late MainCubit mainCubit = context.read<MainCubit>();
  double previousOffset = 0;
  bool scrolledTo800 = false;
  bool scrolledTo1600 = false;
  bool scrolledTo2400 = false;

  @override
  void initState() {
    super.initState();
    mainCubit.rootScrollTag.addListener(() {
      double currentOffset = mainCubit.rootScrollTag.offset;
      if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
        // Scrolling down
        if (currentOffset > previousOffset) {
          _autoScrollDown(currentOffset);
        }

        // Scrolling up
        if (currentOffset < previousOffset) {
          _autoScrollUp(currentOffset);
        }

        previousOffset = currentOffset;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebSmoothScroll(
        controller: mainCubit.rootScrollTag,
        scrollOffset: 60, // additional offset to users scroll input
        animationDuration:
            500, // duration of animation of scroll in milliseconds
        curve: Curves.easeIn,

        child: Container(
          decoration: const BoxDecoration(color: primaryColor),
          child: Column(
            children: [
              TabBarWeb(
                controller: mainCubit.rootScrollTag,
              ).paddingSymmetric(h: 50.w, v: 10.w),
              Expanded(
                child: ListView(
                  controller: mainCubit.rootScrollTag,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    AutoScrollTag(
                      key: const ValueKey(0),
                      controller: mainCubit.rootScrollTag,
                      index: 0,
                      child: SizedBox(
                        height: 800.w,
                        child: const BioWeb().paddingSymmetric(h: 50.w),
                      ),
                    ),
                    AutoScrollTag(
                      key: const ValueKey(3),
                      controller: mainCubit.rootScrollTag,
                      index: 1,
                      child: SizedBox(
                        height: 800.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            RandomWidgetMove(
                              top: 100.w,
                              left: 10.w,
                              child: SizedBox(
                                width: 150.w,
                                child: Image.asset(
                                  fit: BoxFit.cover,
                                  "assets/imgs/rock2.png",
                                ).animate().blur(
                                    duration: 400.ms,
                                    curve: Curves.easeIn,
                                    end: const Offset(9, 9)),
                              ),
                            ),
                            Positioned(
                                    bottom: 200.w,
                                    right: -80.w,
                                    child: SizedBox(
                                      width: 400.w,
                                      child: Image.asset(
                                        "assets/imgs/cube.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                                .animate(
                                  onPlay: (controller) =>
                                      controller.repeat(reverse: true),
                                )
                                .move(
                                  begin: Offset(0.w, 100.w),
                                  end: Offset(0.w, 50.w),
                                  curve: Curves.easeInOutSine,
                                  duration: 8.seconds,
                                ),
                            const AboutWeb().paddingSymmetric(h: 50.w),
                          ],
                        ),
                      ),
                    ),
                    AutoScrollTag(
                      key: const ValueKey(5),
                      controller: mainCubit.rootScrollTag,
                      index: 2,
                      child: SizedBox(
                        height: 800.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                                    top: 100.w,
                                    right: -100.w,
                                    child: SizedBox(
                                      width: 350.w,
                                      child: Image.asset(
                                        fit: BoxFit.cover,
                                        "assets/imgs/rock2.png",
                                      ),
                                    ))
                                .animate(
                                  onPlay: (controller) =>
                                      controller.repeat(reverse: true),
                                )
                                .move(
                                  begin: Offset(0.w, 100.w),
                                  end: Offset(0.w, 50.w),
                                  curve: Curves.easeInOutSine,
                                  duration: 8.seconds,
                                ),
                            RandomWidgetMove(
                              top: 200.w,
                              left: 600.w,
                              child: Image.asset("assets/imgs/circle.png",
                                      width: 180.w)
                                  .animate()
                                  .blur(
                                      duration: 400.ms,
                                      curve: Curves.easeIn,
                                      end: const Offset(9, 9)),
                            ),
                            RandomWidgetMove(
                              bottom: 200.w,
                              right: 500.w,
                              child: Image.asset("assets/imgs/circle.png",
                                      width: 180.w)
                                  .animate()
                                  .blur(
                                      duration: 400.ms,
                                      curve: Curves.easeIn,
                                      end: const Offset(9, 9)),
                            ),
                            Positioned(
                                    top: 300.w,
                                    left: -50.w,
                                    child: SizedBox(
                                      width: 300.w,
                                      child: Image.asset(
                                        fit: BoxFit.cover,
                                        "assets/imgs/cube.png",
                                      ),
                                    ))
                                .animate(
                                  onPlay: (controller) =>
                                      controller.repeat(reverse: true),
                                )
                                .move(
                                  begin: Offset(0.w, 100.w),
                                  end: Offset(0.w, 50.w),
                                  curve: Curves.easeInOutSine,
                                  duration: 8.seconds,
                                ),
                            const MyServicesWeb().paddingSymmetric(h: 50.w),
                          ],
                        ),
                      ),
                    ),
                    AutoScrollTag(
                      key: const ValueKey(7),
                      controller: mainCubit.rootScrollTag,
                      index: 3,
                      child: SizedBox(
                        height: 800.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const MyProjectsWeb().paddingSymmetric(h: 50.w),
                          ],
                        ),
                      ),
                    ),
                    const FooterWidget().paddingOnly(bottom: 20.w)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _autoScrollDown(double currentOffset) {
    if (currentOffset <= 10) {
      scrolledTo800 = false;
    }
    if (currentOffset >= 100.w && currentOffset < 800.w && !scrolledTo800) {
      mainCubit.rootScrollTag
          .animateTo(800.w, curve: Curves.easeInOut, duration: 500.ms);
      scrolledTo800 = true;
      scrolledTo1600 = false;
      scrolledTo2400 = false;
    }
    //
    else if (currentOffset > 850.w &&
        currentOffset < 1600.w &&
        !scrolledTo1600) {
      mainCubit.rootScrollTag
          .animateTo(1600.w, curve: Curves.easeInOut, duration: 500.ms);
      scrolledTo800 = false;
      scrolledTo1600 = true;
      scrolledTo2400 = false;
    }
    //
    else if (currentOffset > 1650.w && !scrolledTo2400) {
      mainCubit.rootScrollTag
          .animateTo(2400.w, curve: Curves.easeInOut, duration: 500.ms);
      scrolledTo800 = false;
      scrolledTo1600 = false;
      scrolledTo2400 = true;
    }
  }

  _autoScrollUp(double currentOffset) {
    if (currentOffset >= 2300) {
      scrolledTo2400 = false;
    }

    if (currentOffset <= 700.w && !scrolledTo800) {
      mainCubit.rootScrollTag
          .animateTo(0.w, curve: Curves.easeInOut, duration: 500.ms);
      scrolledTo800 = true;
      scrolledTo1600 = false;
      scrolledTo2400 = false;
    }
    //
    else if (currentOffset > 850.w &&
        currentOffset <= 1500.w &&
        !scrolledTo1600) {
      mainCubit.rootScrollTag
          .animateTo(800.w, curve: Curves.easeInOut, duration: 500.ms);
      scrolledTo800 = false;
      scrolledTo1600 = true;
      scrolledTo2400 = false;
    }
    //
    else if (currentOffset > 1650.w &&
        currentOffset <= 2300.w &&
        !scrolledTo2400) {
      mainCubit.rootScrollTag
          .animateTo(1600.w, curve: Curves.easeInOut, duration: 500.ms);
      scrolledTo800 = false;
      scrolledTo1600 = false;
      scrolledTo2400 = true;
    }
  }
}
