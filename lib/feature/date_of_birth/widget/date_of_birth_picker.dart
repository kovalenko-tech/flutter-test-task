import 'package:apptest/common/common.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateOfBirthPicker extends StatefulWidget {
  const DateOfBirthPicker({
    required this.startAt,
    required this.endedAt,
    required this.onSelected,
    super.key,
  });

  final DateTime startAt;
  final DateTime endedAt;
  final Function(int) onSelected;

  @override
  _DateOfBirthPickerState createState() => _DateOfBirthPickerState();
}

class _DateOfBirthPickerState extends State<DateOfBirthPicker> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.colors.white,
      child: _buildContentWidget(context),
    );
  }

  Widget _buildContentWidget(BuildContext context) {
    final count = widget.endedAt.year - widget.startAt.year;

    return Container(
      height: 300.h,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 67.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: context.colors.whiteSmoke,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              initialPage: count - 1,
              scrollDirection: Axis.vertical,
              autoPlay: false,
              enableInfiniteScroll: false,
              height: 300.h,
              enlargeCenterPage: true,
              enlargeFactor: 0.22,
              viewportFraction: 0.2,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
                widget.onSelected(widget.startAt.year + index + 1);
              },
            ),
            items: List.generate(
              count.toInt(),
              (index) => Builder(
                builder: (BuildContext context) {
                  return Text(
                    (widget.startAt.year + index + 1).toString(),
                    textAlign: TextAlign.center,
                    style: context.textTheme.header1,
                  );
                },
              ),
            ),
          ),
          IgnorePointer(
            child: Container(
              height: 115.h,
              decoration: BoxDecoration(
                gradient: context.gradient.topPickerGradient,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IgnorePointer(
              child: Container(
                height: 115.h,
                decoration: BoxDecoration(
                  gradient: context.gradient.bottomPickerGradient,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
