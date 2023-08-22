import 'package:apptest/common/common.dart';
import 'package:apptest/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceCellWidget extends StatelessWidget {
  const ChoiceCellWidget({
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 131.h,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 31.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: context.colors.forgetMeNot,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: Assets.images.arrow.svg(
                  colorFilter: context.colors.tilight.filter,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.header2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Text(
                    subtitle,
                    style: context.textTheme.pirmaryText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
