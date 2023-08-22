import 'package:apptest/common/common.dart';
import 'package:apptest/generated/app_strings.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/choice_cubit.dart';
import 'widget/widget.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({
    required this.onNext,
    super.key,
  });

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChoiceCubit>(),
      child: BlocConsumer<ChoiceCubit, ChoiceState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () => onNext(),
          );
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                const ChoiceBackgroudWidget(),
                Padding(
                  padding: EdgeInsets.only(left: 34.w, right: 37.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChoiceCellWidget(
                        title: LocaleKeys.choice_options_1_title.tr(),
                        subtitle: LocaleKeys.choice_options_1_subtitle.tr(),
                        onTap: () => context.read<ChoiceCubit>().save(
                              value: LocaleKeys.choice_options_1_title.tr(),
                            ),
                      ),
                      SizedBox(height: 73.h),
                      ChoiceCellWidget(
                        title: LocaleKeys.choice_options_2_title.tr(),
                        subtitle: LocaleKeys.choice_options_2_subtitle.tr(),
                        onTap: () => context.read<ChoiceCubit>().save(
                              value: LocaleKeys.choice_options_2_title.tr(),
                            ),
                      ),
                      SizedBox(height: 80.h),
                    ],
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
