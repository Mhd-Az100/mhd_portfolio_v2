// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/resources/projects_list.dart';
import 'package:mhd_portfolio_v2/widgets/title_of_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MyProjectsWeb extends StatefulWidget {
  const MyProjectsWeb({super.key});

  @override
  State<MyProjectsWeb> createState() => _MyProjectsWebState();
}

class _MyProjectsWebState extends State<MyProjectsWeb> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  bool paddingBool = false;
  @override
  void initState() {
    // final  myCustomCursor = await CustomMouseCursor.asset('myCursorImage.png',  hotX:2, hotY:2 );

    super.initState();
  }

  int indexSelected = 0;
  Future scrollToIndex(int index) async {
    setState(() {
      indexSelected = index;
    });
    await itemScrollController.scrollTo(
        alignment: 0.4,
        curve: Curves.easeIn,
        index: index,
        duration: const Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const TitleOfSection(text: "My Projects"),
        SizedBox(height: 50.w),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 400.w,
                width: 100.w,
                child: ScrollablePositionedList.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemScrollController: itemScrollController,
                    itemPositionsListener: itemPositionsListener,
                    shrinkWrap: true,
                    itemCount: MyProjectsList.myProjects.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            InkWell(
                              onTap: () {
                                scrollToIndex(index);
                              },
                              child: SizedBox(
                                width: 100.w,
                                height: 100.w,
                                child: Stack(
                                  children: [
                                    index == indexSelected
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
                                                                color:
                                                                    blueColor,
                                                                offset: Offset(
                                                                    5.w, 3.w),
                                                                blurRadius: 20),
                                                            BoxShadow(
                                                                color:
                                                                    purpleColor,
                                                                offset: Offset(
                                                                    -5.w, -3.w),
                                                                blurRadius:
                                                                    20.w)
                                                          ]))
                                                  .animate(
                                                      target:
                                                          index == indexSelected
                                                              ? 1
                                                              : 0)
                                                  .fadeIn(
                                                      duration: 500.ms,
                                                      curve:
                                                          Curves.easeInCubic),
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
                                                color: index == indexSelected
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
              ),
            ),
            Expanded(
              flex: 3,
              child: MouseRegion(
                onEnter: (_) {
                  // Handle mouse enter event, e.g., show the arrow
                  // Set a flag or state to show the arrow
                },
                onExit: (_) {
                  // Handle mouse exit event, e.g., hide the arrow
                  // Clear the flag or state to hide the arrow
                },
                child: GestureDetector(
                  onTap: () {
                    // Handle click and lift functionality here
                    // You can navigate, open a modal, or perform any action as needed
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        MyProjectsList.myProjects[indexSelected].title ?? '',
                        style: GoogleFonts.nunito(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w600,
                            color: whiteLight),
                      ),
                      Wrap(
                        children: MyProjectsList
                                .myProjects[indexSelected].technology
                                ?.map((e) => Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: blueColor),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Center(
                                            child: Text(
                                              e,
                                              style: GoogleFonts.nunito(
                                                  fontSize: 12.sp,
                                                  color: blueColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ).paddingSymmetric(h: 10.w, v: 3),
                                        ],
                                      ),
                                    ).paddingSymmetric(h: 5.w, v: 5.w))
                                .toList() ??
                            [],
                      ),
                      SizedBox(height: 30.w),
                      ReadMoreText(
                        text: MyProjectsList
                                .myProjects[indexSelected].desciption ??
                            '',
                        textStyle: GoogleFonts.nunito(
                          fontSize: 16.sp,
                          color: whiteLight,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: MouseRegion(
                onEnter: (_) {
                  // Handle mouse enter event, e.g., show the arrow
                  // Set a flag or state to show the arrow
                },
                onExit: (_) {
                  // Handle mouse exit event, e.g., hide the arrow
                  // Clear the flag or state to hide the arrow
                },
                child: GestureDetector(
                  onTap: () {
                    // Handle click and lift functionality here
                    // You can navigate, open a modal, or perform any action as needed
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/imgs/background.png",
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/imgs/mock.png",
                        width: 340.w,
                        // height: ?.w,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ReadMoreText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const ReadMoreText({
    super.key,
    required this.text,
    required this.textStyle,
  });

  void _showFullTextDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 25, 28, 34),
          content: SingleChildScrollView(
            child: Text(text, style: textStyle).paddingAll(25.w),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        ).paddingSymmetric(h: 200.w);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: textStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 7, // Adjust the maximum number of lines to show initially
        ),
        GestureDetector(
          onTap: () {
            _showFullTextDialog(context);
          },
          child: const Text(
            'Read More...',
            style: TextStyle(
              color: Colors.blue, // You can customize the button style
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
