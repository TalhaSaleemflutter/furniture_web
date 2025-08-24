import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/widgets/custom_button.dart';

class PremiumSampleMobile extends StatefulWidget {
  const PremiumSampleMobile({super.key});

  @override
  State<PremiumSampleMobile> createState() => _PremiumSampleMobileState();
}

class _PremiumSampleMobileState extends State<PremiumSampleMobile> {
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
          style: AppTextStyles.mobAuthHeadingText3(context),
        ),
        SizedBox(height: 10.h),
        Text(
          "We offer Wide range of beautifully designed sofas",
          style: AppTextStyles.mobBodyText3(
            context,
          ).copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        Text(
          "Discover the Finest Sofa Materials for Your Stylish Living Space",
          style: AppTextStyles.mobBodyText2(context),
        ),

        SizedBox(height: 10.h),
        Container(
          height: 500.h,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(6.r),
          ),
          padding: EdgeInsets.all(6.sp),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedSofa,
                          style: AppTextStyles.mobAuthHeadingText2(
                            context,
                          ).copyWith(fontSize: 18.sp),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Sofas Built for Comfort & Style:',
                          style: AppTextStyles.mobAuthHeadingText2(context),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'We offer a premium range of sofas in plush, chenille, and naple fabrics, available in a wide choice of colors to match every home. Designed for elegance and lasting comfort, your sofa is delivered anywhere in the UK within 3 days. Enjoy pay-on-delivery convenience and friendly support from our dedicated team.',
                          style: AppTextStyles.mobBodyText2(context),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10.h),
                        CustomButton(
                          borderColor: ButtonColor2,
                          txtColor: white,
                          fontSize: 12.sp,
                          width: 120.w,
                          height: 35.h,
                          bgColor: ButtonColor2,
                          text: selectedSofa,
                          onTap: () {},
                        ),
                      ],
                    ),
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
        SizedBox(height: 10.h),
        Wrap(
          spacing: 8, // horizontal spacing
          runSpacing: 12, // vertical spacing between rows
          alignment: WrapAlignment.center,
          children:
              sofas.map((sofa) {
                final isSelected = selectedSofa == sofa['title'];
                return SizedBox(
                  width: 100, // adjust width so 3 buttons fit per row
                  child: CustomButton(
                    borderColor: grey4,
                    bodrerWidth: 0.4.w,
                    fontSize: 12.sp,
                    height: 35.h,
                    txtColor: isSelected ? white : black,
                    bgColor: isSelected ? ButtonColor2 : pureWhite,
                    text: sofa['title']!,
                    onTap: () {
                      setState(() {
                        selectedSofa = sofa['title']!;
                      });
                    },
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
