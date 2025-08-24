import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/utlis/constants/theme/theme_helper.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isObscureText;
  final TextEditingController? controller;
  final VoidCallback onTap;
  final Widget? suffixIcon;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? readOnly;

  final double borderWidth;
  final Color? borderColor;
  final BorderRadius? borderRadius;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.isObscureText = false,
    required this.onTap,
    this.suffixIcon,
    this.fillColor,
    this.height,
    this.width,
    this.validator,
    this.fontSize,
    this.onChanged,
    this.readOnly,
    this.borderWidth = 1.0,
    this.borderColor,
    this.borderRadius, // ✅ new
  });

  @override
  Widget build(BuildContext context) {
    final Color resolvedBorderColor =
        borderColor ?? ThemeHelper.getFieldBorderColor(context);

    final BorderRadius resolvedBorderRadius =
        borderRadius ?? BorderRadius.circular(10.r);

    return Container(
      height: height ?? 65.h,
      child: TextFormField(
        readOnly: readOnly ?? false,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        onTap: onTap,
        obscureText: isObscureText,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? ThemeHelper.getFieldColor(context),
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: resolvedBorderColor,
              width: borderWidth,
            ),
            borderRadius: resolvedBorderRadius, // ✅ use here
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: pureWhite, width: borderWidth),
            borderRadius: resolvedBorderRadius,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: borderWidth),
            borderRadius: resolvedBorderRadius,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: pureWhite, width: borderWidth),
            borderRadius: resolvedBorderRadius,
          ),
          hintText: hintText,
          hintStyle: AppTextStyles.bodyText2(
            context,
          ).copyWith(fontSize: fontSize ?? 4.sp),
          suffixIcon: suffixIcon,
        ),
        validator: validator,
      ),
    );
  }
}
