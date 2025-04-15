import 'package:e_commerce/common/custom_container.dart';
import 'package:e_commerce/common/custome_appbar.dart';
import 'package:e_commerce/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(132.h),
        child: CustomeAppBar(),
      ),
      body: SafeArea(child: CustomContainer()),
    );
  }
}
