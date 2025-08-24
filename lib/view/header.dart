import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/const.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/utlis/constants/theme/theme_helper.dart';
import 'package:furniture_web/widgets/custom_button.dart';
import 'package:furniture_web/widgets/custom_divider.dart';
import 'package:furniture_web/widgets/custom_textfield.dart';

class Header extends StatelessWidget {
  Header({super.key});
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Flags
              Row(children: [_flagWithLabel("🇬🇧", "UK")]),

              Row(
                children: [
                  SizedBox(width: 60.w),

                  FaIcon(FontAwesomeIcons.envelope, size: 5.sp, color: black),
                  SizedBox(width: 2.w),
                  Text(
                    "sofalounge.co.uk@gmail.com",
                    style: AppTextStyles.bodyText2(context),
                  ),
                  SizedBox(width: 10.sp),
                  Icon(Icons.phone, size: 5.sp, color: black),
                  SizedBox(width: 2.w),
                  Text("0322-7149659", style: AppTextStyles.bodyText2(context)),
                  SizedBox(width: 10.w),
                  Icon(Icons.person_outline, size: 5.sp, color: black),
                  SizedBox(width: 2.w),
                  Text("My Account", style: AppTextStyles.bodyText2(context)),
                ],
              ),

              // Social Icons
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      launchFacebookProfile();
                    },
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 5.sp,
                      color: Color(0xFF1877F2),
                    ),
                  ),

                  SizedBox(width: 3.w),
                  FaIcon(
                    FontAwesomeIcons.twitter,
                    size: 5.sp,
                    color: Color(0xFF1DA1F2),
                  ),
                  SizedBox(width: 3.w),
                  FaIcon(
                    FontAwesomeIcons.instagram,
                    size: 5.sp,
                    color: Color(0xFFE4405F),
                  ), // Instagram Pink
                  SizedBox(width: 3.w),
                  // LinkedIn Blue
                  FaIcon(
                    FontAwesomeIcons.youtube,
                    size: 5.sp,
                    color: Color(0xFFFF0000),
                  ), // YouTube Red
                  SizedBox(width: 3.w),
                  GestureDetector(
                    onTap: () {
                      openWhatsApp();
                    },
                    child: FaIcon(
                      FontAwesomeIcons.whatsapp,
                      size: 5.sp,
                      color: Color(0xFF25D366),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15.h),
          CustomDivider(
            direction: Axis.horizontal,
            height: 0.1.w,
            width: 350.w,
            color: grey2_5,
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120.h,
                width: 80.w,
                child: Image.asset(AppAssets.logo_3),
              ),
              Expanded(
                child: CustomTextField(
                  controller: searchController,
                  borderWidth: 0.4.w,
                  height: 60.h,
                  borderRadius: BorderRadius.circular(18.r),
                  fontSize: 5.sp,
                  hintText: 'Search for Products from here..',
                  // validator: (value) {},
                  onTap: () {},
                ),
              ),
              SizedBox(width: 40.w),
              CustomButton(
                width: 30.w,
                height: 40.h,
                borderColor: ButtonColor,
                txtColor: ButtonColor,
                bgColor: pureWhite,
                text: 'Reviews',
                onTap: () {},
              ),
              SizedBox(width: 5.w),
              CustomButton(
                width: 30.w,
                height: 40.h,
                txtColor: pureWhite,
                bgColor: ButtonColor,
                text: 'Get Quote',
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _flagWithLabel(String flag, String label) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Row(
        children: [
          Text(flag, style: TextStyle(fontSize: 5.sp)),
          SizedBox(width: 4.w),
          Text(label, style: TextStyle(fontSize: 5.sp)),
        ],
      ),
    );
  }
}
