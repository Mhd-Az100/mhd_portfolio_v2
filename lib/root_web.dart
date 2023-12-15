// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
import 'package:mhd_portfolio_v2/widgets/footer_widget_web.dart';
import 'package:mhd_portfolio_v2/widgets/random_move_widget.dart';
import 'package:mhd_portfolio_v2/widgets/tabbar_web/tabbar_web.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (mainCubit.rootScrollTag.position.userScrollDirection ==
              ScrollDirection.reverse) {
            context.read<MainCubit>().isScrollingForward(true);
          } else if (mainCubit.rootScrollTag.position.userScrollDirection ==
              ScrollDirection.forward) {
            context.read<MainCubit>().isScrollingForward(false);
          }
          return true;
        },
        child: Container(
          decoration: const BoxDecoration(color: primaryColor),
          child: Column(
            children: [
              BlocBuilder<MainCubit, MainState>(
                builder: (context, state) {
                  return AnimatedSwitcher(
                    // opacity: state.scrollDown ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: state.scrollDown
                        ? const SizedBox.shrink()
                        : TabBarWeb(
                            controller: mainCubit.rootScrollTag,
                          ).paddingSymmetric(h: 50.w, v: 10.w),
                  );
                },
              ),
              Expanded(
                child: ListView(
                  controller: mainCubit.rootScrollTag,
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
}
