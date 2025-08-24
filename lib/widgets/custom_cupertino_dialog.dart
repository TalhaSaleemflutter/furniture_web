import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/responsiveness/responsive.dart';

void cupertinoDialog(BuildContext context, String message, {bool isSuccess = true}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Alert'),
        content: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                isSuccess ? AppAssets.icTick : AppAssets.icCross, // choose image based on bool
                height: 80.h,
                width: 80.h,
              ),
              SizedBox(height: 20.h),
              Text(
                message,
                style: AppTextStyles.bodyText3(context).copyWith(
                  fontSize: Responsive.isMobile(context) ? 14.sp : 6.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

Future<void> showCustomConfirmationDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onConfirm,
}) async {
  return showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          width: 300.w, // Adjust dialog width
          padding: EdgeInsets.all(16.w), // Add padding around the dialog
          child: CupertinoAlertDialog(
            title: Text(title, style: AppTextStyles.bodyText1(context)),
            content: Padding(
              padding: EdgeInsets.only(
                top: 10.h,
              ), // Add space between title and content
              child: Text(
                message,
                style: AppTextStyles.bodyText1(context), // Increase text size
              ),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  onConfirm(); // Call the confirm function
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
