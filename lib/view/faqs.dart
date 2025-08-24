import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
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
          top: 0,
          bottom: 0,
          child: SvgPicture.asset(
            AppAssets.faq_image_3,
            color: white3,
            width: 200.w,
          ),
        ),

        // Foreground content
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            // color: white1, // Slightly transparent to show image
            borderRadius: BorderRadius.circular(6.r),
          ),
          padding: EdgeInsets.all(6.sp),
          child: Column(
            children: [
              Center(
                child: Text(
                  "FAQ's",
                  style: AppTextStyles.authHeadingText2(context),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Find answers to common questions",
                style: AppTextStyles.bodyText3(context),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 800.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First column
                    Expanded(child: _buildFaqColumn(0, 3)),
                    SizedBox(width: 20.w),
                    // Second column
                    Expanded(child: _buildFaqColumn(3, 3)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFaqColumn(int startIndex, int count) {
    return Column(
      children: List.generate(count, (index) {
        final faqIndex = startIndex + index;
        if (faqIndex >= faqs.length) return const SizedBox.shrink();

        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: _buildFaqItem(faqIndex),
        );
      }),
    );
  }

  Widget _buildFaqItem(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: expandedIndex == index ? tealUltraLight : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: expandedIndex == index ? tealLighter : grey2_5,
          width: 0.2.w,
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
            size: 6.sp,
          ),
          title: Text(
            faqs[index]['question']!,
            style: AppTextStyles.bodyText2(context),
          ),
          children: [
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                faqs[index]['answer']!,
                style: AppTextStyles.bodyText2(context).copyWith(color: grey3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
