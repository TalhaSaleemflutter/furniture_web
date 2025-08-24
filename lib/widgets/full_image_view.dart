import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_web/utlis/responsiveness/responsive.dart';

class FullImageDialogContent extends StatefulWidget {
  final List<ImageProvider> images;
  final int initialIndex;

  const FullImageDialogContent({
    Key? key,
    required this.images,
    required this.initialIndex,
  }) : super(key: key);

  @override
  State<FullImageDialogContent> createState() => _FullImageDialogContentState();
}

class _FullImageDialogContentState extends State<FullImageDialogContent> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  void _goToPage(int index) {
    if (index >= 0 && index < widget.images.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.white24, width: 2.w),
      ),
      padding: EdgeInsets.all(12.r),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Image(image: widget.images[index], fit: BoxFit.contain),
              );
            },
          ),

          // Left arrow
          if (_currentIndex > 0)
            Positioned(
              left: 8.w,
              child: _buildArrowButton(Icons.arrow_back_ios, () {
                _goToPage(_currentIndex - 1);
              }),
            ),

          // Right arrow
          if (_currentIndex < widget.images.length - 1)
            Positioned(
              right: 8.w,
              child: _buildArrowButton(Icons.arrow_forward_ios, () {
                _goToPage(_currentIndex + 1);
              }),
            ),

          // Close button
          Positioned(
            top: 8.h,
            right: 8.w,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: Responsive.isMobile(context) ? 28.sp : 10.sp,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Image counter
          Positioned(
            bottom: 8.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                '${_currentIndex + 1} / ${widget.images.length}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArrowButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white24,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(10.r),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
