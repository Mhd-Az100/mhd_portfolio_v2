// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/cubit/main_cubit.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/sections/about/view/about_mobile.dart';
import 'package:mhd_portfolio_v2/sections/bio/views/bio_mobile.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/view/my_porjects_mobile.dart';
import 'package:mhd_portfolio_v2/sections/my_services/view/my_services_mobile.dart';
import 'package:mhd_portfolio_v2/widgets/footer_widget_mobile.dart';
import 'package:mhd_portfolio_v2/widgets/tabbar_mobile/tabbar_mobile.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class RootScreenMobile extends StatefulWidget {
  const RootScreenMobile({super.key});

  @override
  State<RootScreenMobile> createState() => _RootScreenMobileState();
}

class _RootScreenMobileState extends State<RootScreenMobile> {
  late MainCubit mainCubit = context.read<MainCubit>();
  final ScrollController scrollController = ScrollController();
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
            context.read<MainCubit>().isScrollingDown(true);
          } else if (mainCubit.rootScrollTag.position.userScrollDirection ==
              ScrollDirection.forward) {
            context.read<MainCubit>().isScrollingDown(false);
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
                    duration: const Duration(milliseconds: 500),
                    child: state.scrollDown
                        ? const SizedBox.shrink()
                        : TabBarMobile(
                            controller: mainCubit.rootScrollTag,
                          ).paddingSymmetric(h: 10, v: 10),
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
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            bottom: 0,
                            right: -30,
                            child: SizedBox(
                              width: 140,
                              child: Image.asset(
                                fit: BoxFit.cover,
                                "assets/imgs/rock2.png",
                              ),
                            ),
                          ),
                          const BioMobile(),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    AutoScrollTag(
                      key: const ValueKey(3),
                      controller: mainCubit.rootScrollTag,
                      index: 1,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: 0,
                            left: -20,
                            child: SizedBox(
                              width: 100,
                              child: Image.asset(
                                fit: BoxFit.cover,
                                "assets/imgs/rock2.png",
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 20,
                              right: -30,
                              child: SizedBox(
                                width: 150,
                                child: Image.asset(
                                  "assets/imgs/cube.png",
                                  fit: BoxFit.cover,
                                ),
                              )),
                          const AboutMobile().paddingSymmetric(h: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    AutoScrollTag(
                      key: const ValueKey(5),
                      controller: mainCubit.rootScrollTag,
                      index: 2,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              top: 100,
                              right: -20,
                              child: SizedBox(
                                width: 150,
                                child: Image.asset(
                                  fit: BoxFit.cover,
                                  "assets/imgs/rock2.png",
                                ),
                              )),
                          Image.asset("assets/imgs/circle.png", width: 30)
                              .animate()
                              .blur(
                                  duration: 400.ms,
                                  curve: Curves.easeIn,
                                  end: const Offset(9, 9)),
                          Image.asset("assets/imgs/circle.png", width: 35),
                          Positioned(
                              bottom: -30,
                              left: -50,
                              child: SizedBox(
                                width: 140,
                                child: Image.asset(
                                  fit: BoxFit.cover,
                                  "assets/imgs/cube.png",
                                ),
                              )),
                          const MyServicesMobile().paddingSymmetric(h: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    AutoScrollTag(
                      key: const ValueKey(7),
                      controller: mainCubit.rootScrollTag,
                      index: 3,
                      child: SizedBox(
                        height: 900,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const MyProjectsMobile().paddingSymmetric(h: 20),
                          ],
                        ),
                      ),
                    ),
                    const FooterWidgetMobile().paddingOnly(bottom: 20)
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
