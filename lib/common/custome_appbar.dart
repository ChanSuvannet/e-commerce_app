import 'package:e_commerce/common/app_style.dart';
import 'package:e_commerce/common/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      width: width,
      height: 120.h,
      color: kWhite,
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    maxRadius: 20.r,
                    backgroundColor: kSecondary,
                    backgroundImage: const NetworkImage(
                      "https://thumbs.dreamstime.com/b/d-icon-avatar-cute-smiling-woman-cartoon-hipster-character-people-close-up-portrait-isolated-transparent-png-background-352288894.jpg",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.h, left: 8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: "Chan Suvannet",
                          style: appStyle(12, kSecondary, FontWeight.w600),
                        ),
                        SizedBox(
                          width: width * 0.4, // Adjust width if needed
                          child: Text(
                            "1234  21st Avn N, Phnom Penh",
                            overflow: TextOverflow.ellipsis,
                            style: appStyle(11, kGrayLight, FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(getTimeOfDay(), style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 0 && hour < 12) {
      return '☀️';
    } else if (hour > 12 && hour < 16) {
      return '⛅';
    } else {
      return ' 🌙';
    }
  }
}
