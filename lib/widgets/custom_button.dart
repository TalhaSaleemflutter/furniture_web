import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Color? txtColor;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final double? bodrerWidth;
  
  final double? fontSize;
  final Color? borderColor;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    this.bgColor,
    this.txtColor,
    this.bodrerWidth,
    this.onTap,
    this.height,
    this.width,
    this.fontSize,
    this.borderColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: width ?? 50.w, // fixed width - adjust based on your design
        height: height ?? 50.h,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: bgColor ?? Theme.of(context).primaryColor,
          border: Border.all(
            width: bodrerWidth ?? 0.7,
            color: borderColor ?? (bgColor ?? Theme.of(context).primaryColor),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child:
            isLoading
                ? Center(
                  child: SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: CircularProgressIndicator(
                      color: txtColor ?? Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                )
                : Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyText2(context).copyWith(
                      color: txtColor ?? Colors.white,
                      fontSize: fontSize ?? 4.sp,
                    ),
                  ),
                ),
      ),
    );
  }
}
