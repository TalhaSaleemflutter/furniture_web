import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/widgets/custom_button.dart';
import 'package:furniture_web/widgets/custom_divider.dart';
import 'package:furniture_web/widgets/custom_textfield.dart';

class Footer extends StatelessWidget {
  Footer({super.key});
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.h,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo and Description Section
              Container(
                height: 300.h,
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: pureWhite,
                ),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Image.asset(AppAssets.logo_3),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'We offer a wide range of beautifully designed sofas. With fast and reliable delivery within just 3 days, your comfort won’t have to wait. Our friendly dispatch team is always available to assist you with any queries. We’re proud to have a devoted team committed to you. We also offer payment at the time of delivery.',
                      style: AppTextStyles.bodyText1(
                        context,
                      ).copyWith(color: grey6),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),

              // Contact Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Need Quick Assistance? Get In Touch',
                    style: AppTextStyles.authHeadingText2(context),
                  ),
                  SizedBox(height: 20.h),

                  // Phone
                  Row(
                    children: [
                      Icon(Icons.phone, color: black, size: 10.sp),
                      SizedBox(width: 5.w),
                      Text(
                        '0322-7149659',
                        style: AppTextStyles.authHeadingText2(context).copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  // Email & WhatsApp
                  Row(
                    children: [
                      Icon(
                        Icons.mail_outline_outlined,
                        color: black,
                        size: 5.sp,
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        'sofalounge.co.uk@gmail.com',
                        style: AppTextStyles.bodyText2(context),
                      ),
                      SizedBox(width: 8.w),
                      CustomDivider(
                        direction: Axis.vertical,
                        width: 0.2.w,
                        height: 20.h,
                      ),
                      SizedBox(width: 8.w),
                      FaIcon(
                        FontAwesomeIcons.whatsapp,
                        size: 5.sp,
                        color: black,
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        '0322-7149659',
                        style: AppTextStyles.bodyText2(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  // Address
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        color: black,
                        size: 5.sp,
                      ),
                      SizedBox(width: 3.w),
                      SizedBox(
                        width: 180.w,
                        child: Text(
                          '56 Highfield Road, Edgbaston, Birmingham, B15 3ED, UK',
                          style: AppTextStyles.bodyText2(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // Divider
          SizedBox(height: 30.h),
          CustomDivider(
            direction: Axis.horizontal,
            height: 0.2.w,
            width: 350.w,
            color: black,
          ),
          SizedBox(height: 30.h),
          Text(
            'Get more update Join our newsletter',
            textAlign: TextAlign.left,
            style: AppTextStyles.bodyText2(
              context,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 80.w,
                    child: CustomTextField(
                      hintText: 'Enter Your Email Here',
                      controller: emailController,

                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10.w),
                  CustomButton(
                    width: 30.w,
                    height: 38.h,
                    txtColor: white,
                    bgColor: ButtonColor,
                    text: 'Submit',
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    //  width: 80.w,
                    height: 50.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: Image.asset(
                        AppAssets.payment,
                        fit:
                            BoxFit
                                .contain, // or BoxFit.fill if you want it to fully stretch
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'Our Secure Payment Modes',
                    textAlign: TextAlign.left,
                    style: AppTextStyles.bodyText2(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25.h),
          Center(
            child: Text(
              '© 2025 Premium Sofa Co. All rights reserved.',
              style: AppTextStyles.bodyText2(context).copyWith(color: grey5),
            ),
          ),
        ],
      ),
    );
  }
}
