import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/app_assets.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/widgets/full_image_view.dart';

class CustomAdsCardWidgetMobile extends StatefulWidget {
  final String? statusText;
  final Color? statusColor;
  final String title;
  final String price;
  final Color priceColor;
  final String category;
  final Color categoryColor;
  final bool showCornerIcon;
  final VoidCallback? onTap;
  final VoidCallback? onCornerIconTap;
  final IconData? cornerIcon;
  final Color? cornerIconColor;
  final List<ImageProvider>? backgroundImages;
  final VoidCallback? onOrderNowTap; // NEW parameter

  const CustomAdsCardWidgetMobile({
    super.key,
    this.statusText,
    this.statusColor,
    required this.title,
    required this.price,
    required this.priceColor,
    required this.category,
    required this.categoryColor,
    this.showCornerIcon = false,
    this.onTap,
    this.onCornerIconTap,
    this.cornerIcon,
    this.cornerIconColor,
    this.backgroundImages,
    this.onOrderNowTap, // NEW parameter
  });

  @override
  State<CustomAdsCardWidgetMobile> createState() =>
      _CustomAdsCardWidgetMobileState();
}

class _CustomAdsCardWidgetMobileState extends State<CustomAdsCardWidgetMobile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          color: pureWhite,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: bgColor, width: 0.1.w),
          boxShadow: [BoxShadow(color: Colors.black12)],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    if (widget.backgroundImages != null &&
                        widget.backgroundImages!.isNotEmpty) {
                      _showFullImageDialog(
                        context,
                        widget.backgroundImages!,
                        0,
                      );
                    }
                  },
                  child: Container(
                    height: 120.h,
                    width: double.infinity,

                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(6.r), // only top corners
                      ),
                      child:
                          widget.backgroundImages?.isNotEmpty ?? false
                              ? Image(
                                image: widget.backgroundImages!.first,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    AppAssets.icPlaceholder,
                                    fit: BoxFit.cover,
                                  );
                                },
                              )
                              : Image.asset(
                                AppAssets.icPlaceholder,
                                fit: BoxFit.cover,
                              ),
                    ),
                  ),
                ),

                if (widget.showCornerIcon)
                  Positioned(
                    top: 6.h,
                    right: 3.w,
                    child: GestureDetector(
                      onTap: widget.onCornerIconTap,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(6.r),
                        child: Icon(
                          widget.cornerIcon ?? Icons.favorite_border,
                          color: widget.cornerIconColor ?? Colors.red,
                          size: 8.sp,
                        ),
                      ),
                    ),
                  ),
                if (widget.statusText != null)
                  Positioned(
                    top: 8.h,
                    left: 8.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: widget.statusColor ?? Colors.green,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        widget.statusText!,
                        style: AppTextStyles.mobBodyText1(
                          context,
                        ).copyWith(color: pureWhite),
                      ),
                    ),
                  ),
              ],
            ),

            // Replace the entire Padding section with this code:
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.mobBodyText3(
                          context,
                        ).copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        widget.category,
                        style: AppTextStyles.mobBodyText1(
                          context,
                        ).copyWith(height: 1.6.h),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        widget.price,
                        style: AppTextStyles.mobBodyText3(context).copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onEnter: (_) => setState(() => _isHovered = true),
                        onExit: (_) => setState(() => _isHovered = false),
                        child: GestureDetector(
                          onTap: widget.onOrderNowTap,
                          child: Text(
                            'Order Now ->',
                            style: AppTextStyles.mobBodyText3(context).copyWith(
                              color: _isHovered ? Colors.red : orderNowColor,
                              fontWeight: FontWeight.bold,
                              decoration:
                                  _isHovered
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showFullImageDialog(
  BuildContext context,
  List<ImageProvider> images,
  int initialIndex,
) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.85),
    builder:
        (_) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: FullImageDialogContent(
            images: images,
            initialIndex: initialIndex,
          ),
        ),
  );
}
