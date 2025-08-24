import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/widgets/custom_button.dart';
import 'package:furniture_web/widgets/spiner_loader.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350.h,
      decoration: BoxDecoration(
        color: webColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        children: [
          // Left Side: Text & Buttons
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SofaLounge.co",
                  style: GoogleFonts.dancingScript(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Premium Sofas, Affordable Elegance ",
                  style: AppTextStyles.authHeadingText2(context),
                ),

                Text(
                  "Modern, stylish seating made for everyday living",
                  style: AppTextStyles.authHeadingText2(
                    context,
                  ).copyWith(color: ButtonColor2, fontSize: 6.sp),
                ),
                SizedBox(height: 20.h),

                Wrap(
                  spacing: 2.w,
                  runSpacing: 3.h,
                  children: [
                    CustomButton(
                      height: 40.h,
                      width: 48.w,
                      txtColor: white,
                      bgColor: ButtonColor2,
                      text: 'Get Instant Quote',
                      onTap: () {},
                    ),
                    CustomButton(
                      height: 40.h,
                      width: 50.w,
                      txtColor: white,
                      bgColor: ButtonColor2,
                      text: 'Get Customize Sofa',
                      onTap: () {},
                    ),
                    CustomButton(
                      height: 40.h,
                      width: 48.w,
                      txtColor: white,
                      bgColor: ButtonColor2,
                      text: 'Get Instant Deliver',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          //SizedBox(width: 10.w),
          Expanded(
            child: Image.asset(
              AppAssets.image_4,
              fit: BoxFit.contain, // or BoxFit.cover, as needed
            ),
          ),
        ],
      ),
    );
  }
}
