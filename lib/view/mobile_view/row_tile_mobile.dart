import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';

class RowTileMobile extends StatelessWidget {
  const RowTileMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        color: webColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _IconWithText(
                    icon: Icons.description,
                    text: 'Band new Sofas',
                  ),
                  _IconWithText(
                    icon: Icons.design_services,
                    text: 'Best Quality',
                  ),
                  _IconWithText(icon: Icons.print, text: 'Payment on delivery'),
                ],
              ),
            ),
            SizedBox(width: 25.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _IconWithText(icon: Icons.verified, text: 'FSC Certified'),
                  _IconWithText(
                    icon: Icons.access_time,
                    text: 'Quickest Turnaround',
                  ),
                  _IconWithText(
                    icon: Icons.local_shipping,
                    text: 'Free Shipping',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;

  const _IconWithText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15.sp, color: black),
        SizedBox(width: 4.w),
        Expanded(
          // Added Expanded here
          child: Text(
            text,
            style: AppTextStyles.mobBodyText3(context),
            overflow: TextOverflow.ellipsis, // Handles overflow with ellipsis
            maxLines: 2, // Allows text to wrap to second line if needed
          ),
        ),
      ],
    );
  }
}
