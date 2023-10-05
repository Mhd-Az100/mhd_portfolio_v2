// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';
import 'package:mhd_portfolio_v2/resources/services_list.dart';
import 'package:mhd_portfolio_v2/sections/my_services/widgets/service_card_widget.dart';
import 'package:mhd_portfolio_v2/widgets/title_of_section.dart';

class MyServicesWeb extends StatelessWidget {
  const MyServicesWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleOfSection(text: "What I Can Do ?"),
        SizedBox(height: 70.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ServiceCard(
              service: MyServicesList.myServicesList[0],
            ),
            SizedBox(width: 50.w),
            ServiceCard(
              service: MyServicesList.myServicesList[1],
            ),
          ],
        ).paddingSymmetric(h: 150.w),
        SizedBox(height: 50.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ServiceCard(
              service: MyServicesList.myServicesList[2],
            ),
            SizedBox(width: 50.w),
            ServiceCard(
              service: MyServicesList.myServicesList[3],
            ),
          ],
        ).paddingSymmetric(h: 150.w),
      ],
    );
  }
}