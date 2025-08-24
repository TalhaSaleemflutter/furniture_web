import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/provider/product_provider.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/widgets/custom_ads_card_widget.dart';
import 'package:furniture_web/widgets/custom_ads_card_widget.mobile.dart';
import 'package:furniture_web/widgets/order_detail_dialog_mobile.dart';
import 'package:furniture_web/widgets/order_dialog.dart';
import 'package:provider/provider.dart';

class ProductsSectionMobile extends StatelessWidget {
  const ProductsSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, value, Widget? child) {
        final adProducts = value.adProducts;

        return Container(
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(4.r),
          ),
          padding: EdgeInsets.all(4.sp),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                '- Sit in Style -',
                style: AppTextStyles.mobAuthHeadingText1(context),
              ),
              Text(
                'Handpicked designs for stylish UK homes.',
                style: AppTextStyles.mobAuthHeadingText0(context),
              ),

              // Text(
              //   'Explore our exclusive collection of handpicked sofas, designed to bring elegance, comfort, and timeless style into your living space. Perfect for UK homes that deserve more than ordinary, our sofas are crafted to elevate your interior ..',
              //   style: AppTextStyles.mobBodyText1(context),
              //   textAlign: TextAlign.center, // <-- This will justify the text
              // ),
              SizedBox(height: 40.h),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount;

                  if (constraints.maxWidth >= 1100) {
                    crossAxisCount = 4;
                  } else if (constraints.maxWidth >= 700) {
                    crossAxisCount = 2;
                  } else {
                    crossAxisCount = 2;
                  }

                  return GridView.builder(
                    shrinkWrap: true, // Important for nested scrolling
                    physics:
                        const NeverScrollableScrollPhysics(), // Let parent handle scrolling
                    itemCount: adProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 30.h,

                      childAspectRatio:
                          (constraints.maxWidth / crossAxisCount) / 300.h,
                    ),
                    itemBuilder: (context, index) {
                      final ad = adProducts[index];
                      // final images = ad.listOfImages;
                      return CustomAdsCardWidgetMobile(
                        onOrderNowTap: () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => OrderDetailDialogMobile(order: ad),
                          ); // pass ad directly
                        },
                        title: ad.title,
                        price: '\£ ${ad.price.toStringAsFixed(2)}',
                        category: ad.description,
                        statusText: ad.condition,
                        statusColor: Colors.lightBlue,
                        priceColor: Colors.green,
                        categoryColor: Colors.blue,
                        showCornerIcon: true,
                        onTap: () {},
                        onCornerIconTap: () {},
                        backgroundImages:
                            ad.listOfImages
                                .map((path) => AssetImage(path))
                                .toList(), // ✅ Convert here
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
