import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/utlis/constants/theme/theme_helper.dart';

class UKPhoneTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validator; // ✅ external validator
  final double? height;
  final double? width;
  final double? fontSize;

  const UKPhoneTextField({
    Key? key,
    this.controller,
    this.hintText = "(+44) xxxx xxxxxx",
    this.onChanged,
    this.onTap,
    this.validator,
    this.height,
    this.width,

    this.fontSize, // ✅ pass from parent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 65.h,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
        onTap: onTap,
        onChanged: onChanged,
        validator: validator, // ✅ use external validator
        decoration: InputDecoration(
          filled: true,
          fillColor: ThemeHelper.getFieldColor(context),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 12.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.4.w,
              color: ThemeHelper.getFieldBorderColor(context),
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primary),
            borderRadius: BorderRadius.circular(10.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primary),
            borderRadius: BorderRadius.circular(10.r),
          ),
          hintText: hintText,
          hintStyle: AppTextStyles.bodyText2(
            context,
          ).copyWith(fontSize: fontSize ?? 4.sp),
          suffixIcon: const Icon(Icons.phone, color: Colors.amber),
        ),
      ),
    );
  }
}
