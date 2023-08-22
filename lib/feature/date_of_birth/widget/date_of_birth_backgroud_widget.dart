import 'package:apptest/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateOfBirthBackgroudWidget extends StatelessWidget {
  const DateOfBirthBackgroudWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Stack(
        children: [
          Assets.images.dateOfBirth.figure1.svg(),
          Positioned(
            right: 70.w,
            top: 28.h,
            child: Assets.images.dateOfBirth.figure2.svg(),
          ),
          Positioned(
            right: 0,
            bottom: 290.h,
            child: Assets.images.dateOfBirth.figure3.svg(),
          ),
          Positioned(
            left: 28.w,
            bottom: 72.h,
            child: Assets.images.dateOfBirth.figure4.svg(),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Assets.images.dateOfBirth.figure5.svg(),
          ),
        ],
      ),
    );
  }
}
