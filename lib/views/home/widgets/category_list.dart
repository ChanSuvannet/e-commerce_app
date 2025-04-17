import 'package:e_commerce/common/app_style.dart';
import 'package:e_commerce/common/reusable_text.dart';
import 'package:e_commerce/constants/constants.dart';
import 'package:e_commerce/constants/uidata.dart';
import 'package:e_commerce/controllers/category_controller.dart';
import 'package:e_commerce/views/category/all_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(categories.length, (i) {
          var category = categories[i];
          return CategoryWidget(controller: controller, category: category);
        }),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.controller,
    required this.category,
  });

  final CategoryController controller;
  final dynamic category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.selectedCategory == category['_id']) {
          controller.selectedCategory = '';
          controller.selectedTitle = '';
        } else if (category['value'] == 'more') {
          Get.to(
            () => const AllCategories(),
            transition: Transition.fadeIn,
            duration: const Duration(microseconds: 900),
          );
        } else {
          controller.selectedCategory = category['_id'];
          controller.selectedTitle = category['title'];
        }
      },
      child: Obx(() {
        bool isSelected = controller.selectedCategory == category['_id'];

        return AnimatedScale(
          scale: isSelected ? 0.95 : 0.9,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(right: 5.w),
            padding: EdgeInsets.only(top: 4.w),
            width: width * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: isSelected ? kSecondary : kWhite,
                width: 0.8.w,
              ),
              color: isSelected ? kSecondary.withOpacity(0.01) : kWhite,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 35.w,
                  child: Image.network(
                    category['imageUrl'],
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.broken_image,
                        size: 30,
                        color: Colors.grey,
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    },
                  ),
                ),
                ReusableText(
                  text: category['title'],
                  style: appStyle(12, kDark, FontWeight.normal),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
