import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/widgets/custom_button.dart';
import 'package:furniture_web/widgets/spiner_loader.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerWidgetMobile extends StatelessWidget {
  const BannerWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500.h,
      decoration: BoxDecoration(
        color: webColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          // Left Side: Text & Buttons
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SofaLounge.co",
                  style: GoogleFonts.dancingScript(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Premium Sofas, Affordable Elegance ",
                  style: AppTextStyles.mobAuthHeadingText2(context),
                ),

                Expanded(
                  child: Image.asset(
                    AppAssets.image_4,
                    fit: BoxFit.contain, // or BoxFit.cover, as needed
                  ),
                ),
                SizedBox(height: 20.h),

                Wrap(
                  spacing: 8.w,
                  runSpacing: 3.h,
                  children: [
                    CustomButton(
                      height: 40.h,
                      width: 90.w,
                      fontSize: 8.sp,
                      txtColor: white,
                      bgColor: ButtonColor,
                      text: 'Get Instant Quote',
                      onTap: () {},
                    ),
                    CustomButton(
                      height: 40.h,
                      width: 90.w,
                      fontSize: 7.sp,
                      txtColor: white,
                      bgColor: ButtonColor,
                      text: 'Get Customize Sofa',
                      onTap: () {},
                    ),
                    CustomButton(
                      height: 40.h,
                      width: 90.w,
                      fontSize: 8.sp,
                      txtColor: white,
                      bgColor: ButtonColor,
                      text: 'Get Instant Deliver',
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),

          //SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
