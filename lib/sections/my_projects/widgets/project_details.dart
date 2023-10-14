// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/cubit/main_cubit.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/resources/projects_list.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets/inprogress_card.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets/readmore_widget.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets/store_button.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/widgets/technology_card.dart';
import 'package:url_launcher/url_launcher.dart';

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
