import 'package:e_commerce/common/app_style.dart';
import 'package:e_commerce/common/back_ground_container.dart';
import 'package:e_commerce/common/reusable_text.dart';
import 'package:e_commerce/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/uidata.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhite,
        title: ReusableText(
          text: "All Categories",
          style: appStyle(16, kDark, FontWeight.normal),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: kDark),
      ),

      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(categories.length, (i) {
              var category = categories[i];
              return ListTile(
                leading: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: kGrayLight,
                  backgroundImage: NetworkImage(category['imageUrl']),
                ),
        
                title: ReusableText(
                  text: category['title'],
                  style: appStyle(13, kGray, FontWeight.normal),
                ),
        
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: kGray,
                  size: 18.r,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
