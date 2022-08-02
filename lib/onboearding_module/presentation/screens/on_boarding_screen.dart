import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:secrtaria/core/constants/constant.dart';
import 'package:secrtaria/core/widgets/custom_button_widget.dart';
import '../controller/page_view_controller.dart';
import '../widgets/page_view_item.dart';
import '../widgets/skip_button.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  final PageController controllerForPageMovements = PageController();
  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageViewController>(
      init: PageViewController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              //! Page View Items Builder
              PageView.builder(
                controller: controllerForPageMovements,
                itemBuilder: (context, index) {
                  return PageViewItem(
                    itemsDataController: controller,
                    itemIndex: index,
                  );
                },
                itemCount: controller.listOfPageViewItemsData.length,
                onPageChanged: (index) {
                  controller.changeIndicatorIndex(newIndexValue: index);
                },
              ),

              //! Skip Button
              Positioned(
                top: 50.h,
                right: 40.w,
                child: SkipButton(
                  controller: controller,
                  onTap: () {
                    controller.changeIndicatorIndex(newIndexValue: 9);
                    controllerForPageMovements.animateToPage(
                      9,
                      duration: const Duration(microseconds: 1000),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),

              //! Dots Indicator
              Positioned(
                bottom: 140.h,
                left: 0,
                right: 0,
                child: DotsIndicator(
                  position: (controller.indicatorIndex).toDouble(),
                  dotsCount: controller.listOfPageViewItemsData.length,
                  decorator: DotsDecorator(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    color: Colors.transparent,
                    activeColor: Constant.kMainColor,
                  ),
                ),
              ),

              //! Next And Get Start Button
              Positioned(
                bottom: 10.h,
                right: 0,
                left: 0,
                child: CustomButton(
                  buttonAction: () {
                    goToNextPage(controller);
                  },
                  buttonHeight: 50.h,
                  buttonMargin: 20.w,
                  buttonText:
                      controller.indicatorIndex != 9 ? "nextButton".tr : "getStartedButton".tr,
                  buttonTextFontSize: 18.sp,
                  buttonWidth: Get.width,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void goToNextPage(PageViewController controller) {
    controller.changeIndicatorIndex(
        newIndexValue: controller.indicatorIndex < 9
            ? controller.indicatorIndex + 1
            : controller.indicatorIndex);
    controllerForPageMovements.animateToPage(
      controller.indicatorIndex,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }
}
