import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';

class FaqsMobile extends StatefulWidget {
  const FaqsMobile({super.key});

  @override
  State<FaqsMobile> createState() => _FaqsMobileState();
}

class _FaqsMobileState extends State<FaqsMobile> {
  final List<Map<String, String>> faqs = const [
    {
      'question': 'What fabrics do you offer?',
      'answer':
          'We provide sofas in premium fabrics including Napple, Chenille, and Plush Velvet, available in multiple colors.',
    },
    {
      'question': 'What is your delivery time?',
      'answer':
          'We deliver your sofa within 3 to 4 days directly to your home location across the UK.',
    },
    {
      'question': 'How can I cancel my order?',
      'answer':
          'You can cancel your order by sending us an email directly on our company Gmail address.',
    },
    {
      'question': 'What are the payment options?',
      'answer':
          'We offer the convenience of Cash on Delivery — pay only when your sofa arrives at your home.',
    },
    {
      'question': 'How can I contact your team?',
      'answer':
          'You can reach us instantly by clicking the WhatsApp icon at the bottom of our website or via email support.',
    },
    {
      'question': 'Do you offer discounts?',
      'answer':
          'Yes, we occasionally offer seasonal promotions and special discounts. Follow our page for updates.',
    },
  ];

  int? expandedIndex;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image aligned to right
        Positioned(
          right: 2,
          top: 2,
          bottom: 0,
          child: SvgPicture.asset(
            AppAssets.faq_image_3,
            color: white3,
            width: 200.w,
            height: 400.h,
          ),
        ),

        // Foreground content
        Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
          padding: EdgeInsets.all(6.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "FAQ's",
                  style: AppTextStyles.mobAuthHeadingText3(context),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Find answers to common questions",
                style: AppTextStyles.mobBodyText3(context),
              ),
              SizedBox(height: 20.h),

              // ✅ Show all FAQs in a single column
              Column(
                children: List.generate(faqs.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: _buildFaqItem(index),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFaqItem(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: expandedIndex == index ? tealUltraLight : Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: expandedIndex == index ? tealLighter : grey2_5,
          width: 0.3.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 0.2.r,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: Key(index.toString()),
          initiallyExpanded: expandedIndex == index,
          onExpansionChanged: (expanded) {
            setState(() {
              expandedIndex = expanded ? index : null;
            });
          },
          tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          childrenPadding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
          ),
          leading: Icon(
            expandedIndex == index ? Icons.remove : Icons.add,
            color: Colors.blue,
            size: 20.sp,
          ),
          title: Text(
            faqs[index]['question']!,
            style: AppTextStyles.mobBodyText2(context),
          ),
          children: [
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                faqs[index]['answer']!,
                style: AppTextStyles.mobBodyText2(
                  context,
                ).copyWith(color: grey3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
