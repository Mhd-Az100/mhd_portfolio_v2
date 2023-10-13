import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/resources/content_texts.dart';
import 'package:mhd_portfolio_v2/sections/bio/widgets/contacts_buttons_widget.dart';
import 'package:seo/seo.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      height: 370.w,
      width: 680.w,
      borderRadius: 20.r,
      blur: 20,
      padding: EdgeInsets.all(20.w),
      alignment: Alignment.bottomCenter,
      border: 1.5.w,
      linearGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(70, 68, 68, 70),
            Color.fromARGB(156, 65, 91, 131),
          ],
          stops: [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          whiteLight.withOpacity(0.5),
          blueColor.withOpacity(0.2),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(35.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            ContentText.welcome,
            style: GoogleFonts.nunito(
                fontWeight: FontWeight.w400,
                fontSize: 25.sp,
                color: whiteLight),
          )
              .animate(
            onPlay: (controller) => controller.repeat(reverse: true),
          )
              .shimmer(colors: [
            whiteLight,
            primaryColor.withOpacity(0.3),
            whiteLight,
          ], duration: 8.seconds, curve: Curves.easeInOut),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20.w, bottom: 5.w),
                  child: Seo.text(
                    text: ContentText.name,
                    style: TextTagStyle.h2,
                    child: Text(ContentText.name,
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w600,
                            fontSize: 45.sp,
                            color: whiteLight)),
                  )
                  //     .animate()
                  //     .shimmer(colors: [
                  //   textLight,
                  //   primaryColor,
                  //   blueColor,
                  // ], duration: 2.7.seconds, curve: Curves.easeInOut),
                  ),
              Padding(
                  padding: EdgeInsets.only(left: 20.w, bottom: 20.w),
                  child: Seo.text(
                    text: ContentText.jobTitle,
                    style: TextTagStyle.h5,
                    child: Text(ContentText.jobTitle,
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w500,
                            fontSize: 22.sp,
                            color: whiteLight)),
                  )
                  //     .animate()
                  //     .shimmer(colors: [
                  //   blueColor,
                  //   primaryColor,
                  //   textLight,
                  // ], duration: 2.7.seconds, curve: Curves.easeInOut),
                  ),
            ],
          ),
          SizedBox(
            width: 500.w,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Seo.text(
                text: ContentText.bio,
                style: TextTagStyle.h4,
                child: Text(
                  textAlign: TextAlign.start,
                  ContentText.bio,
                  style:
                      GoogleFonts.nunito(fontSize: 18.spMin, color: whiteLight),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.w),
          const Row(
            children: [
              GlowingButton(
                  svgPath: "assets/svg/gmail.svg",
                  url: "mailto:mohamadalazmeh4@gmail.com"),
              GlowingButton(
                  svgPath: "assets/svg/github.svg",
                  url: "https://github.com/Mhd-Az100"),
              GlowingButton(
                  svgPath: "assets/svg/linkedIn.svg",
                  url:
                      "https://www.linkedin.com/in/mohammad-al-azmeh-026498217/"),
              GlowingButton(
                  svgPath: "assets/svg/telegram.svg",
                  url: "https://t.me/MHD_Al_Azmeh"),
              GlowingButton(
                  svgPath: "assets/svg/whatsapp.svg",
                  url:
                      "https://api.whatsapp.com/send/?phone=%2B963931480357&text&type=phone_number&app_absent=0")
            ],
          )
        ]
            // .animate(interval: 300.ms).slideX(
            //     begin: -10, curve: Curves.easeInOutCubic, duration: 700.ms),
            ),
      ),
    );
  }
}
