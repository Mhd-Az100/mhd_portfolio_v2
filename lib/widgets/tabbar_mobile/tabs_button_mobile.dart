import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/cubit/main_cubit.dart';
import 'package:mhd_portfolio_v2/resources/enums.dart';

class TabButtonMobile extends StatelessWidget {
  const TabButtonMobile({
    super.key,
    required this.tabsEnum,
    required this.text,
    required this.ontap,
  });
  final String text;
  final void Function()? ontap;
  final TabsEnum tabsEnum;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return InkWell(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: ontap,
          child: Text(
            text,
            style: GoogleFonts.nunito(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: whiteLight),
          ),
        );
      },
    );
  }
}
