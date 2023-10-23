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
import 'package:mhd_portfolio_v2/widgets/footer_widget.dart';
import 'package:mhd_portfolio_v2/widgets/random_move_widget.dart';
import 'package:mhd_portfolio_v2/widgets/tabbar_widget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class RootScreen extends StatelessWidget {
  RootScreen({super.key});
  // final ScrollController scrollController = ScrollController();
  final scrollTag = AutoScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (scrollTag.position.userScrollDirection ==
              ScrollDirection.reverse) {
            context.read<MainCubit>().isScrollingForward(true);
          } else if (scrollTag.position.userScrollDirection ==
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
                        : TabBarWidget(
                            controller: scrollTag,
                          ).paddingSymmetric(h: 50.w, v: 5.w),
                  );
                },
              ),
              Expanded(
                child: ListView(
                  controller: scrollTag,
                  children: [
                    AutoScrollTag(
                      key: const ValueKey(0),
                      controller: scrollTag,
                      index: 0,
                      child: SizedBox(
                        height: 900.w,
                        child: const BioWeb().paddingSymmetric(h: 50.w),
                      ),
                    ),
                    AutoScrollTag(
                      key: const ValueKey(1),
                      controller: scrollTag,
                      index: 1,
                      child: SizedBox(
                        height: 900.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            RandomWidgetMove(
                              top: 100.w,
                              left: 10.w,
                              child: Image.asset("assets/imgs/rock2.png",
                                      scale: 0.8)
                                  .animate()
                                  .blur(
                                      duration: 400.ms,
                                      curve: Curves.easeIn,
                                      end: const Offset(9, 9)),
                            ),
                            Positioned(
                                    bottom: 200.w,
                                    right: -80.w,
                                    child: Image.asset(
                                      "assets/imgs/cube.png",
                                      scale: 0.5,
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
                      key: const ValueKey(2),
                      controller: scrollTag,
                      index: 2,
                      child: SizedBox(
                        height: 900.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                                    top: 100.w,
                                    right: -100.w,
                                    child: Image.asset(
                                      "assets/imgs/rock2.png",
                                      scale: 0.5,
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
                                    child: Image.asset(
                                      "assets/imgs/cube.png",
                                      scale: 0.7,
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
                      key: const ValueKey(3),
                      controller: scrollTag,
                      index: 3,
                      child: SizedBox(
                        height: 900.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const MyProjectsWeb().paddingSymmetric(h: 50.w),
                          ],
                        ),
                      ),
                    ),
                    const FooterWidget().paddingSymmetric(v: 20.w)
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
