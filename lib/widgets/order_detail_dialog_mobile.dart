import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/provider/order_provider.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/widgets/confirmation_dialog_mobile.dart';
import 'package:provider/provider.dart';
import 'package:furniture_web/model/product_model.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/widgets/confirmation_dialog.dart';
import 'package:furniture_web/widgets/custom_button.dart';
import 'package:furniture_web/widgets/custom_phone_textfield.dart';
import 'package:furniture_web/widgets/custom_textfield.dart';

class OrderDetailDialogMobile extends StatefulWidget {
  final ProductModel order;

  const OrderDetailDialogMobile({Key? key, required this.order})
    : super(key: key);

  @override
  State<OrderDetailDialogMobile> createState() =>
      _OrderDetailDialogMobileState();
}

class _OrderDetailDialogMobileState extends State<OrderDetailDialogMobile> {
  late final GlobalKey<FormState> formKey;
  late final OrderProvider orderProvider;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    orderProvider = Provider.of<OrderProvider>(context, listen: false);

    // Initialize order fields safely after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      orderProvider.updateCurrentOrderField('prodId', widget.order.prodId);
      orderProvider.updateCurrentOrderField('title', widget.order.title);
      orderProvider.updateCurrentOrderField('price', widget.order.price);
      orderProvider.updateCurrentOrderField(
        'createdAt',
        widget.order.createdAt,
      );
    });
  }

  bool isValidUKPhone(String phone) {
    final pattern = r'^(\+44\s?7\d{3}|\(?07\d{3}\)?)\s?\d{3}\s?\d{3}$';
    return RegExp(pattern).hasMatch(phone);
  }

  Future<void> next() async {
    if (formKey.currentState!.validate()) {
      if (!mounted) return;
      Navigator.of(context).pop();

      final updatedOrder = orderProvider.currentOrder;
      await ConfirmationDialogMobile.show(context, updatedOrder);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: pureWhite,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Container(
        // width: 200.w,
        padding: EdgeInsets.all(12.r),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Center(
                  child: Text(
                    widget.order.title ?? "Product",
                    style: AppTextStyles.mobBodyText3(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.h),

                // Image
                Container(
                  height: 100.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: bgColor),
                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                  ),
                  child:
                      widget.order.listOfImages.isNotEmpty
                          ? Image(
                            image: AssetImage(widget.order.listOfImages.first),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image(
                                image: const AssetImage(
                                  AppAssets.icPlaceholder,
                                ),
                                fit: BoxFit.contain,
                                height: 40.h, // Adjust size as needed
                                width: 40.w,
                              );
                            },
                          )
                          : Image(
                            image: const AssetImage(AppAssets.icPlaceholder),
                            fit: BoxFit.contain,
                            height: 40.h, // Adjust size as needed
                            width: 40.w,
                          ),
                ),
                SizedBox(height: 18.h),

                // Name + Postcode
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        borderWidth: 0.4.w,
                        height: 45.h,
                        fontSize: 12.sp,
                        hintText: 'Your Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your Name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          orderProvider.updateCurrentOrderField('name', value);
                        },
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: CustomTextField(
                        borderWidth: 0.4.w,
                        hintText: 'Post Code',
                        height: 45.h,
                        fontSize: 12.sp,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Post Code';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          orderProvider.updateCurrentOrderField(
                            'postcode',
                            value,
                          );
                        },
                        onTap: () {},
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 5.h),

                // Email
                CustomTextField(
                  borderWidth: 0.4.w,
                  hintText: 'Your Email',
                  height: 45.h,
                  fontSize: 12.sp,
                  validator: (val) {
                    if (val!.trim().isEmpty) {
                      return 'Email is required';
                    }
                    final emailRegex = RegExp(
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                    );
                    if (!emailRegex.hasMatch(val)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    orderProvider.updateCurrentOrderField('email', value);
                  },
                  onTap: () {},
                ),
                SizedBox(height: 5.h),
                // Address
                CustomTextField(
                  borderWidth: 0.4.w,
                  hintText: 'Home Address',
                  height: 45.h,
                  fontSize: 12.sp,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Address';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    orderProvider.updateCurrentOrderField('address', value);
                  },
                  onTap: () {},
                ),
                SizedBox(height: 5.h),
                // Phone
                UKPhoneTextField(
                  height: 45.h,
                  fontSize: 12.sp,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your phone number";
                    }
                    if (!isValidUKPhone(value)) {
                      return "Enter a valid UK phone number";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    orderProvider.updateCurrentOrderField('phoneNumber', val);
                  },
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      width: 80.w,
                      height: 40.h,
                      fontSize: 15.sp,
                      borderColor: bgColor,
                      txtColor: black,
                      bodrerWidth: 0.3.w,
                      bgColor: pureWhite,
                      text: 'Cancel',
                      onTap: () {
                        Navigator.pop(context);
                        orderProvider.clearCurrentOrder(
                          false,
                        ); // Clear without notifying
                      },
                    ),
                    SizedBox(width: 5.w),
                    CustomButton(
                      width: 80.w,
                      height: 40.h,
                      fontSize: 15.sp,
                      borderColor: orderNowColor,
                      txtColor: pureWhite,
                      bodrerWidth: 0.4.w,
                      bgColor: orderNowColor,
                      text: 'Next',
                      onTap: next,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
