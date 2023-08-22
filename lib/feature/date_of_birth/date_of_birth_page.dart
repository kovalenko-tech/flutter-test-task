import 'package:apptest/common/common.dart';
import 'package:apptest/generated/app_strings.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/date_of_birth_cubit.dart';
import 'widget/widget.dart';

class DateOfBirthPage extends StatefulWidget {
  const DateOfBirthPage({
    required this.onNext,
    super.key,
  });

  final VoidCallback onNext;

  @override
  State<DateOfBirthPage> createState() => _DateOfBirthPageState();
}

class _DateOfBirthPageState extends State<DateOfBirthPage> {
  final startDateTime = DateTime(1900);
  final endDateTime = DateTime.now();
  var selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DateOfBirthCubit>(),
      child: BlocConsumer<DateOfBirthCubit, DateOfBirthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () => widget.onNext(),
          );
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                const DateOfBirthBackgroudWidget(),
                Padding(
                  padding: EdgeInsets.only(left: 31.w, right: 28.w),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text(
                          LocaleKeys.date_of_birth_title.tr(),
                          textAlign: TextAlign.center,
                          style: context.textTheme.header3,
                        ),
                        SizedBox(height: 36.h),
                        DateOfBirthPicker(
                          startAt: startDateTime,
                          endedAt: endDateTime,
                          onSelected: (year) {
                            setState(() {
                              selectedYear = year;
                            });
                          },
                        ),
                        const Spacer(),
                        ArrowButton(
                          title: LocaleKeys.date_of_birth_button_next.tr(),
                          onTap: () => context.read<DateOfBirthCubit>().save(year: selectedYear),
                        ),
                        SizedBox(height: 81.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
