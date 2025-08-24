import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/constants/app_textstyle.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';

class ServicesMobile extends StatefulWidget {
  const ServicesMobile({super.key});

  @override
  State<ServicesMobile> createState() => _ServicesMobileState();
}

class _ServicesMobileState extends State<ServicesMobile>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late AnimationController _animationController;
  final double _scrollDuration = 30.0;
  bool _isHovered = false;

  final List<Map<String, dynamic>> services = [
    {
      'icon': Icons.inventory_2_outlined,
      'title': 'No Minimum Order Qty',
      'desc':
          'Order as few or as many items as you need without any minimum quantity restrictions.',
    },
    {
      'icon': Icons.sell_outlined,
      'title': 'Cheapest Prices',
      'desc':
          'Benefit from the most competitive prices available in the market without compromising on quality.',
    },
    {
      'icon': Icons.schedule,
      'title': 'Quickest Turnaround',
      'desc':
          'Get your orders processed and delivered promptly, ensuring the fastest turnaround time possible.',
    },
    {
      'icon': Icons.home_outlined,
      'title': 'Home Delivery',
      'desc':
          'Enjoy fast and reliable sofa delivery straight to your doorstep within 3 to 4 days anywhere in the UK.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _scrollDuration.toInt()),
    )..addListener(_scrollAnimationListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _scrollAnimationListener() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final double offset = maxScroll * _animationController.value;
    _scrollController.jumpTo(offset);

    if (_animationController.status == AnimationStatus.completed) {
      _animationController.repeat();
    }
  }

  void _startScrolling() {
    if (!mounted) return;
    _animationController.forward();
  }

  void _pauseScrolling() {
    _animationController.stop();
  }

  void _resumeScrolling() {
    if (_animationController.status == AnimationStatus.dismissed ||
        _animationController.status == AnimationStatus.completed) {
      _animationController.forward();
    } else {
      _animationController.repeat();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildServiceItem(Map<String, dynamic> service) {
    return SizedBox(
      width: 200.w,

      child: Padding(
        padding: EdgeInsets.only(right: 25.w),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Changed to min to prevent overflow
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(service['icon'], size: 40.sp, color: Colors.black),
            SizedBox(height: 8.h),
            Flexible(
              // Added Flexible to prevent text overflow
              child: Text(
                service['title'],
                textAlign: TextAlign.center,
                maxLines: 2, // Limit to 2 lines
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.mobBodyText3(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 6.h),
            Flexible(
              // Added Flexible to prevent text overflow
              child: Text(
                service['desc'],
                textAlign: TextAlign.center,
                maxLines: 3, // Limit to 3 lines
                // overflow: TextOverflow.ellipsis,
                style: AppTextStyles.mobBodyText2(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: MouseRegion(
        onEnter: (_) => _pauseScrolling(),
        onExit: (_) => _resumeScrolling(),
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length * 3,
          itemBuilder:
              (context, index) =>
                  _buildServiceItem(services[index % services.length]),
        ),
      ),
    );
  }
}
