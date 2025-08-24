import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/const.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/widgets/custom_divider.dart';
import 'package:furniture_web/widgets/custom_textfield.dart';

class MobileHeader extends StatelessWidget {
  MobileHeader({super.key});

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),

      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Flags
              Row(children: [_flagWithLabel("🇬🇧", "UK")]),
              // Social Icons
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      launchFacebookProfile();
                    },
                    child: FaIcon(
                      FontAwesomeIcons.facebookF,
                      size: 12.sp,
                      color: grey4,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  // FaIcon(FontAwesomeIcons.xTwitter, size: 12.sp, color: grey4),
                  // SizedBox(width: 6.w),
                  FaIcon(FontAwesomeIcons.youtube, size: 12.sp, color: grey4),
                  SizedBox(width: 6.w),
                  FaIcon(FontAwesomeIcons.instagram, size: 12.sp, color: grey4),
                  SizedBox(width: 6.w),

                  GestureDetector(
                    onTap: () {
                      openWhatsApp();
                    },
                    child: FaIcon(
                      FontAwesomeIcons.whatsapp,
                      size: 12.sp,
                      color: grey4,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email_outlined, size: 12.sp, color: black),
              SizedBox(width: 2.w),
              Text(
                "sofalounge.co.uk@gmail.com",
                style: AppTextStyles.mobBodyText2(context),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.phone, size: 12.sp, color: black),
              SizedBox(width: 2.w),
              Text("0322-7149659", style: AppTextStyles.mobBodyText2(context)),
              SizedBox(width: 8.w),
              Icon(Icons.person_outline, size: 14.sp, color: black),
              SizedBox(width: 2.w),
              Text("My Account", style: AppTextStyles.mobBodyText2(context)),
            ],
          ),

          SizedBox(height: 10.h),
          CustomDivider(
            direction: Axis.horizontal,
            height: 0.5.w,
            width: 350.w,
            color: grey2_5,
          ),
          SizedBox(height: 15.h),
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.center, // ✅ center vertically
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 140.h,
                width: 100.w,
                child: Image.asset(AppAssets.logo_3),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: CustomTextField(
                  controller: searchController,
                  borderWidth: 0.4.w,
                  height: 60.h,
                  fontSize: 12.sp,
                  hintText: 'Search for Products from here..',

                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _flagWithLabel(String flag, String label) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Row(
        children: [
          Text(flag, style: TextStyle(fontSize: 15.sp)),
          SizedBox(width: 4.w),
          Text(label, style: TextStyle(fontSize: 15.sp)),
        ],
      ),
    );
  }
}
