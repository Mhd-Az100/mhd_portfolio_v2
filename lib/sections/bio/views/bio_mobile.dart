import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/sections/bio/widgets_mobile/glass_card_info_mobile.dart';

class BioMobile extends StatelessWidget {
  const BioMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.h),
      child: const InfoCardMobile(),
    );
  }
}
