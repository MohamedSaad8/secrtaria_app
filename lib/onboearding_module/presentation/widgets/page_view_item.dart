import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/constant.dart';
import '../controller/page_view_controller.dart';

class PageViewItem extends StatelessWidget {
    final int itemIndex ;
    final PageViewController itemsDataController ;
  const PageViewItem({super.key, required this.itemIndex, required this.itemsDataController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          itemsDataController.listOfPageViewItemsData[itemIndex].imagePath,
          width: Get.width / 1.8,
          height: Get.width / 1.8,
        ),
        Text(
          itemsDataController.listOfPageViewItemsData[itemIndex].title,
          style: TextStyle(
              color: Constant.kMainColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            itemsDataController.listOfPageViewItemsData[itemIndex].description,
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: "cairo",
                fontWeight: FontWeight.bold,
                height: 1.3),
          ),
        ),
      ],
    );
  }
}
