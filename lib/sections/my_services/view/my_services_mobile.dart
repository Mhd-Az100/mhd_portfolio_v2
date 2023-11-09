// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/resources/services_list.dart';
import 'package:mhd_portfolio_v2/sections/my_services/widgets/service_card_mobile.dart';
import 'package:mhd_portfolio_v2/widgets/title_of_section_mobile.dart';

class MyServicesMobile extends StatelessWidget {
  const MyServicesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleOfSectionMobile(text: "What I Can Do ?"),
        SizedBox(height: 25.w),
        Row(
          children: [
            Expanded(
              child: ServiceCardMobile(
                service: MyServicesList.myServicesList[0],
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: ServiceCardMobile(
                service: MyServicesList.myServicesList[1],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.w),
        Row(
          children: [
            Expanded(
              child: ServiceCardMobile(
                service: MyServicesList.myServicesList[2],
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: ServiceCardMobile(
                service: MyServicesList.myServicesList[3],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
