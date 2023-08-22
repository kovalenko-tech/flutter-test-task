import 'package:apptest/common/common.dart';
import 'package:apptest/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        constraints: BoxConstraints(minWidth: 190.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          gradient: context.gradient.buttonGradient,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.shrink(),
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.textTheme.buttonText.white,
              ),
              Assets.images.arrow.svg(
                colorFilter: context.colors.white.filter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
