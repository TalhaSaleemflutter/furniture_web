import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';

class RowTile extends StatelessWidget {
  const RowTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: webColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(4.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _IconWithText(icon: Icons.description, text: 'Band new Sofas'),
            _IconWithText(icon: Icons.design_services, text: 'Best Quality'),
            _IconWithText(icon: Icons.print, text: 'Payment on delivery'),
            _IconWithText(icon: Icons.local_shipping, text: 'Free Shipping'),
            _IconWithText(icon: Icons.verified, text: 'FSC Certified'),
            _IconWithText(icon: Icons.access_time, text: 'Quickest Turnaround'),
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
        Icon(icon, size: 6.sp, color: Colors.black87),
        SizedBox(width: 2.w),
        Text(text, style: TextStyle(fontSize: 5.sp, color: Colors.black87)),
      ],
    );
  }
}
