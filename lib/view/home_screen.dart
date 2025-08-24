import 'package:furniture_web/utlis/constants/const.dart';
import 'package:furniture_web/view/mobile_view/faqs_mobile.dart';
import 'package:furniture_web/view/mobile_view/footer_mobile.dart';
import 'package:furniture_web/view/mobile_view/premium_sample_mobile.dart';
import 'package:furniture_web/view/mobile_view/services_mobile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';
import 'package:furniture_web/utlis/responsiveness/responsive.dart';
import 'package:furniture_web/view/banner_widget.dart';
import 'package:furniture_web/view/faqs.dart';
import 'package:furniture_web/view/footer.dart';
import 'package:furniture_web/view/header.dart';
import 'package:furniture_web/view/mobile_view/banner_widget_mobile.dart';
import 'package:furniture_web/view/mobile_view/mobile_header.dart';
import 'package:furniture_web/view/mobile_view/product_screen_mobile.dart';
import 'package:furniture_web/view/mobile_view/row_tile_mobile.dart';
import 'package:furniture_web/view/premium_sample.dart';
import 'package:furniture_web/view/product_screen.dart';
import 'package:furniture_web/view/row_tile.dart';
import 'package:furniture_web/view/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Mobile base size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: pureWhite,
          body: Stack(
            children: [
              SingleChildScrollView(  
                child: Column(
                  children: [
                    Responsive.isMobile(context) ? MobileHeader() : Header(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        children: [
                          Responsive.isMobile(context)
                              ? const BannerWidgetMobile()
                              : const BannerWidget(),
                          SizedBox(height: 40.h),
                          Responsive.isMobile(context)
                              ? const RowTileMobile()
                              : const RowTile(),
                          SizedBox(height: 30.h),
                          Responsive.isMobile(context)
                              ? const ProductsSectionMobile()
                              : const ProductsSection(),
                          SizedBox(height: 50.h),
                          Responsive.isMobile(context)
                              ? const PremiumSampleMobile()
                              : const PremiumSample(),
                          SizedBox(height: 50.h),
                          Responsive.isMobile(context)
                              ? const ServicesMobile()
                              : const Services(),
                          SizedBox(height: 50.h),
                          Responsive.isMobile(context)
                              ? const FaqsMobile()
                              : const Faqs(),
                          SizedBox(height: 50.h),
                        ],
                      ),
                    ),
                    Responsive.isMobile(context) ? FooterMobile() : Footer(),
                  ],
                ),
              ),
              Positioned(
                bottom: 20.h,
                right: 8.w,
                child: GestureDetector(
                  onTap:() {
                    openWhatsApp();
                  },
                  child: Container(
                    padding: EdgeInsets.all(14.r),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.r,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.white,
                      size: Responsive.isMobile(context) ? 20.sp : 10.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
