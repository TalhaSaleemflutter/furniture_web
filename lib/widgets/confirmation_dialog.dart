import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/model/order_model.dart';
import 'package:furniture_web/provider/order_provider.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/widgets/custom_button.dart';
import 'package:furniture_web/widgets/custom_cupertino_dialog.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/widgets/spiner_loader.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:provider/provider.dart';

class ConfirmationDialog extends StatefulWidget {
  final OrderModel order;

  const ConfirmationDialog({super.key, required this.order});

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();

  /// method to show dialog
  static Future<void> show(BuildContext context, OrderModel order) {
    return showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(order: order),
    );
  }
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  Future<void> createOrder(BuildContext context) async {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    try {
      bool hasInternet =
          await InternetConnectionChecker.createInstance().hasConnection;
      if (!hasInternet) {
        cupertinoDialog(
          context,
          isSuccess: false,
          'Please connect to the internet to Place Order',
        );
        return;
      }
      await orderProvider.uploadCurrentOrder(context);
      if (!mounted) return;
      Navigator.pop(context);
      Future.microtask(() {
        if (!mounted) return;
        cupertinoDialog(context, 'Your Order is Placed Successfully');
      });
    } catch (e) {
      print('Error adding product: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to add product: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: pureWhite,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      content: Consumer<OrderProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return Container(
            width: 90.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Your dialog content (always visible)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Verona 3 seater sofa',
                        style: AppTextStyles.bodyText4(
                          context,
                        ).copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    _buildDetailRow("Name", widget.order.name),
                    _buildDetailRow("Email", widget.order.email),
                    _buildDetailRow("Postcode", widget.order.postcode),
                    _buildDetailRow("Address", widget.order.address),
                    _buildDetailRow("Phone", widget.order.phoneNumber),
                    _buildDetailRow(
                      "Price",
                      widget.order.price.toStringAsFixed(2),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: CustomButton(
                            height: 40.h,
                            borderColor: bgColor,
                            txtColor: black,
                            bodrerWidth: 0.3.w,
                            bgColor: pureWhite,
                            text: 'Cancel',
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: CustomButton(
                            height: 40.h,
                            borderColor: Colors.green,
                            txtColor: pureWhite,
                            bodrerWidth: 0.3.w,
                            bgColor: Colors.green,
                            text: 'Place Order',
                            onTap: () {
                              createOrder(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Loader overlay (only visible when loading)
                if (value.isLoading)
                  Positioned.fill(
                    child: Center(
                      child: SpinningLoader(
                        imagePath: AppAssets.icLoading_2,
                        size: 25.sp,
                        secondsPerRotation: 1.0,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
