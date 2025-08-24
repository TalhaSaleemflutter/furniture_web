import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/widgets/custom_button.dart';
import 'package:furniture_web/widgets/custom_divider.dart';
import 'package:furniture_web/widgets/custom_textfield.dart';

class FooterMobile extends StatelessWidget {
  FooterMobile({super.key});
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Logo + description
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.center, // ✅ center vertically
            mainAxisAlignment:
                MainAxisAlignment.center, // ✅ center horizontally if needed
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: Image.asset(
                  AppAssets.logo_3,
                  height: 120.h,
                  width: 120.w,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Text(
                  'We offer a wide range of beautifully designed sofas. With fast and reliable delivery within just 3 days, your comfort won’t have to wait. Our friendly dispatch team is always available to assist you with any queries.',
                  style: AppTextStyles.mobBodyText2(
                    context,
                  ).copyWith(color: grey6),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          Text(
            'Need Quick Assistance? Get In Touch',
            style: AppTextStyles.mobAuthHeadingText2(
              context,
            ).copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 16.h),

          // Phone
          Row(
            children: [
              Icon(Icons.phone, color: black, size: 18.sp),
              SizedBox(width: 6.w),
              Text(
                '0322-7149659',
                style: AppTextStyles.mobAuthHeadingText3(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // Email & WhatsApp
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.w,
            runSpacing: 6.h,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.mail_outline_outlined, color: black, size: 15.sp),
                  SizedBox(width: 4.w),
                  Text(
                    'sofalounge.co.uk@gmail.com',
                    style: AppTextStyles.mobBodyText2(context),
                  ),
                ],
              ),
              CustomDivider(
                direction: Axis.vertical,
                width: 0.5.w,
                height: 18.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.whatsapp, size: 15.sp, color: black),
                  SizedBox(width: 4.w),
                  Text(
                    '0322-7149659',
                    style: AppTextStyles.mobBodyText2(context),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // Address
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(FontAwesomeIcons.locationDot, color: black, size: 15.sp),
              SizedBox(width: 5.w),
              Expanded(
                child: Text(
                  '56 Highfield Road, Edgbaston, Birmingham, B15 3ED, UK',
                  style: AppTextStyles.mobBodyText2(context),
                ),
              ),
            ],
          ),

          SizedBox(height: 25.h),

          /// Divider
          CustomDivider(
            direction: Axis.horizontal,
            height: 0.5.h,
            width: double.infinity,
            color: black,
          ),
          SizedBox(height: 20.h),

          /// Newsletter
          Text(
            'Get more update Join our newsletter',
            style: AppTextStyles.mobBodyText2(
              context,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: emailController,
                  borderWidth: 0.4.w,
                  fontSize: 12.sp,
                  hintText: 'Enter Your Email here',
                  validator: (value) {},
                  onTap: () {},
                ),
              ),
              SizedBox(width: 40.w),
              CustomButton(
                width: 80.w,
                height: 40.h,
                fontSize: 14.sp,
                txtColor: white,
                bgColor: ButtonColor,
                text: 'Submit',
                onTap: () {},
              ),
            ],
          ),

          SizedBox(height: 20.h),

          /// Payment Modes
          Row(
            children: [
              Container(
                width: 140.w,
                height: 45.h,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Image.asset(AppAssets.payment, fit: BoxFit.contain),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  'Our Secure Payment Modes',
                  style: AppTextStyles.mobBodyText2(
                    context,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          SizedBox(height: 25.h),

          /// Copyright
          Center(
            child: Text(
              '© 2025 Premium Sofa Co. All rights reserved.',
              style: AppTextStyles.mobBodyText2(context).copyWith(color: grey5),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
