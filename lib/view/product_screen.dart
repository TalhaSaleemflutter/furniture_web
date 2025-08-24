import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/provider/product_provider.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/widgets/custom_ads_card_widget.dart';
import 'package:furniture_web/widgets/order_dialog.dart';
import 'package:provider/provider.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

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
          padding: EdgeInsets.all(6.sp),
          child: Column(
            children: [
              Text(
                '- Sit in Style -',
                style: AppTextStyles.authHeadingText2(context),
              ),
              Text(
                'Handpicked designs for stylish UK homes.',
                style: AppTextStyles.authHeadingText0(context),
              ),
              SizedBox(height: 10.h),
              Text(
                'Explore our exclusive collection of handpicked sofas, designed to bring elegance, comfort, and timeless style into your living space. Perfect for UK homes that deserve more than ordinary, our sofas are crafted to elevate your interior ..',
                style: AppTextStyles.bodyText2(context),
                textAlign: TextAlign.center, // <-- This will justify the text
              ),

              SizedBox(height: 50.h),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount;

                  if (constraints.maxWidth >= 1100) {
                    crossAxisCount = 4;
                  } else if (constraints.maxWidth >= 700) {
                    crossAxisCount = 3;
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
                      crossAxisSpacing: 2.w,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      final ad = adProducts[index];
                      // final images = ad.listOfImages;
                      return CustomAdsCardWidget(
                        onOrderNowTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => OrderDetailsDialog(order: ad),
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
