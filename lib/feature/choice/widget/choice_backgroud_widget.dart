import 'package:apptest/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceBackgroudWidget extends StatelessWidget {
  const ChoiceBackgroudWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Stack(
        children: [
          Assets.images.choice.figure1.svg(),
          Positioned(
            left: 67.w,
            bottom: 136.h,
            child: Assets.images.choice.figure2.svg(),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Assets.images.choice.figure3.svg(),
          ),
        ],
      ),
    );
  }
}
