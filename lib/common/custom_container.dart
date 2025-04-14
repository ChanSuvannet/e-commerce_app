import 'package:e_commerce/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final Widget? containerContent;

  const CustomContainer({super.key, this.containerContent});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.77,
      width: width, // Make sure this is defined in your constants
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
        child: Container(
          width: width,
          color: kWhite,
          child: SingleChildScrollView(
            child:
                containerContent ?? const SizedBox.shrink(), // fallback if null
          ),
        ),
      ),
    );
  }
}
