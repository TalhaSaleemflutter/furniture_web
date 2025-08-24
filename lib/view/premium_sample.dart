import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/widgets/custom_button.dart';

class PremiumSample extends StatefulWidget {
  const PremiumSample({super.key});

  @override
  State<PremiumSample> createState() => _PremiumSampleState();
}

class _PremiumSampleState extends State<PremiumSample> {
  // Define the list of sofas and corresponding image paths
  final List<Map<String, String>> sofas = [
    {'title': 'Verona Sofa', 'image': AppAssets.n_v_sofa_6},
    {'title': 'Ashton Sofa', 'image': AppAssets.n_a_sofa_6},
    {'title': 'Dylan 3+2', 'image': AppAssets.sofa_82},
    {'title': 'U-shape Sofa', 'image': AppAssets.u_sofa_13_2},
    {'title': 'Cornor Sofa', 'image': AppAssets.sofa_1_s},
    {'title': 'Roma 3+2', 'image': AppAssets.n_r_sofa_2},
  ];

  String selectedSofa = 'Verona Sofa'; // Default selection

  @override
  Widget build(BuildContext context) {
    final selectedImage =
        sofas.firstWhere((sofa) => sofa['title'] == selectedSofa)['image'];

    return Column(
      children: [
        Text(
          "- Premium Samples -",
          style: AppTextStyles.authHeadingText2(context),
        ),
        SizedBox(height: 10.h),
        Text(
          "We offer Wide range of beautifully designed sofas.",
          style: AppTextStyles.bodyText1(
            context,
          ).copyWith(fontWeight: FontWeight.bold, fontSize: 8.sp),
        ),
        SizedBox(height: 10.h),
        Text(
          "Discover the Finest Sofa Materials for Your Stylish Living Space.",
          style: AppTextStyles.bodyText3(context),
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
              sofas.map((sofa) {
                final isSelected = selectedSofa == sofa['title'];
                return CustomButton(
                  borderColor: grey4,
                  bodrerWidth: 0.4,
                  txtColor: isSelected ? white : black,
                  bgColor: isSelected ? ButtonColor2 : pureWhite,
                  text: sofa['title']!,
                  onTap: () {
                    setState(() {
                      selectedSofa = sofa['title']!;
                    });
                  },
                );
              }).toList(),
        ),
        SizedBox(height: 20.h),
        Container(
          height: 460.h,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(6.r),
          ),
          padding: EdgeInsets.all(6.sp),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedSofa,
                        style: AppTextStyles.authHeadingText2(context),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'Sofas Built for Comfort & Style:',
                        style: AppTextStyles.authHeadingText2(
                          context,
                        ).copyWith(fontSize: 8.sp),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'We offer a premium range of sofas in plush, chenille, and naple fabrics, available in a wide choice of colors to match every home. Designed for elegance and lasting comfort, your sofa is delivered anywhere in the UK within 3 days. Enjoy pay-on-delivery convenience and friendly support from our dedicated team.',
                        style: AppTextStyles.bodyText2(context),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 35.h),
                      CustomButton(
                        borderColor: ButtonColor2,
                        txtColor: white,
                        bgColor: ButtonColor2,
                        text: selectedSofa,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.r),
                  child: Image.asset(selectedImage!, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
