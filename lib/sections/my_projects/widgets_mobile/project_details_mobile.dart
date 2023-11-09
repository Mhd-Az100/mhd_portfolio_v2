// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/resources/projects_list.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets_mobile/inprogress_card_mobile.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets_mobile/readmore_widget_mobile.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets_mobile/store_button_mobile.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets_mobile/technology_card_mobile.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsWidgetMobile extends StatelessWidget {
  const ProjectDetailsWidgetMobile({
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              MyProjectsList.myProjects[index].title ?? '',
              style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: whiteLight),
            ),
            Text(
              "#${MyProjectsList.myProjects[index].workingType}",
              style: GoogleFonts.nunito(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w400,
                  color: whiteLight.withOpacity(0.7)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.place,
                    size: 12.w, color: whiteLight.withOpacity(0.7)),
                SizedBox(width: 2.w),
                Text(
                  "${MyProjectsList.myProjects[index].workingPlace}",
                  style: GoogleFonts.nunito(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: whiteLight.withOpacity(0.7)),
                ),
              ],
            ),
            SizedBox(height: 10.w),
            Wrap(
              children: MyProjectsList.myProjects[index].technology
                      ?.map((e) => TechnologyCardMobile(txt: e)
                          .paddingSymmetric(h: 3.w, v: 3.w))
                      .toList() ??
                  [],
            ),
            SizedBox(height: 15.w),
            ReadMoreTextMobile(
              text: MyProjectsList.myProjects[index].desciption ?? '',
              textStyle: GoogleFonts.nunito(
                fontSize: 9.sp,
                color: whiteLight,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.w),
        Visibility(
          visible: (MyProjectsList.myProjects[index].googlplayLink?.isEmpty ??
                  true) &&
              (MyProjectsList.myProjects[index].appStoreLink?.isEmpty ??
                  true) &&
              (MyProjectsList.myProjects[index].driveLink?.isEmpty ?? true),
          child: InProgressCardMobile(index: index),
        ),
        Visibility(
          visible:
              (MyProjectsList.myProjects[index].driveLink?.isNotEmpty ?? false),
          child: StoreButtonMobile(
            icon: "assets/svg/drive.svg",
            txt: "Drive Link",
            onTap: () async {
              await launchUrl(
                  Uri.parse(MyProjectsList.myProjects[index].driveLink ?? ''));
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              visible:
                  (MyProjectsList.myProjects[index].googlplayLink?.isNotEmpty ??
                      false),
              child: StoreButtonMobile(
                icon: "assets/svg/play.svg",
                txt: "Google Play",
                onTap: () async {
                  await launchUrl(Uri.parse(
                      MyProjectsList.myProjects[index].googlplayLink ?? ''));
                },
              ),
            ),
            SizedBox(width: 20.w),
            Visibility(
              visible:
                  (MyProjectsList.myProjects[index].appStoreLink?.isNotEmpty ??
                      false),
              child: StoreButtonMobile(
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
