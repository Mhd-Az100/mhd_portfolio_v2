import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/resources/content_texts.dart';
import 'package:mhd_portfolio_v2/sections/bio/widgets_mobile/contacts_buttons_mobile.dart';
import 'package:seo/seo.dart';

class InfoCardMobile extends StatelessWidget {
  const InfoCardMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      height: 250,
      width: double.infinity,
      borderRadius: 8.r,
      blur: 20,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.bottomCenter,
      border: 1.5,
      linearGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(30, 169, 169, 195),
            Color.fromARGB(70, 65, 91, 131),
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
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                ContentText.welcome,
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    color: whiteLight),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 5),
                    child: Seo.text(
                      text: ContentText.name,
                      style: TextTagStyle.h2,
                      child: Text(ContentText.name,
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600,
                              fontSize: 21.sp,
                              color: whiteLight)),
                    ).animate().shimmer(colors: [
                      whiteLight,
                      primaryColor,
                      blueColor,
                    ], duration: 2.7.seconds, curve: Curves.easeInOut),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 10.h),
                    child: Seo.text(
                      text: ContentText.jobTitle,
                      style: TextTagStyle.h5,
                      child: Text(ContentText.jobTitle,
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                              color: whiteLight)),
                    ).animate().shimmer(colors: [
                      blueColor,
                      primaryColor,
                      whiteLight,
                    ], duration: 2.7.seconds, curve: Curves.easeInOut),
                  ),
                ],
              ),
              SizedBox(
                width: 230,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Seo.text(
                    text: ContentText.bio,
                    style: TextTagStyle.h4,
                    child: Text(
                      textAlign: TextAlign.start,
                      ContentText.bio,
                      style: GoogleFonts.nunito(
                          fontSize: 10.spMin, color: whiteLight),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              const Row(
                children: [
                  ContactButtonMobile(
                      svgPath: "assets/svg/gmail.svg",
                      url: "mailto:mohamadalazmeh4@gmail.com"),
                  ContactButtonMobile(
                      svgPath: "assets/svg/github.svg",
                      url: "https://github.com/Mhd-Az100"),
                  ContactButtonMobile(
                      svgPath: "assets/svg/linkedIn.svg",
                      url:
                          "https://www.linkedin.com/in/mohammad-al-azmeh-026498217/"),
                  ContactButtonMobile(
                      svgPath: "assets/svg/telegram.svg",
                      url: "https://t.me/MHD_Al_Azmeh"),
                  ContactButtonMobile(
                      svgPath: "assets/svg/whatsapp.svg",
                      url:
                          "https://api.whatsapp.com/send/?phone=%2B963931480357&text&type=phone_number&app_absent=0")
                ],
              )
            ]),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
                width: 140.w,
                child: Image.asset(
                  "assets/imgs/personal.png",
                )),
          )
        ],
      ),
    );
  }
}
