import 'package:apptest/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/result_cubit.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResultCubit>()..init(),
      child: BlocBuilder<ResultCubit, ResultState>(
        builder: (context, state) {
          return Scaffold(
            body: state.maybeWhen(
              success: (option, year) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      option,
                      style: context.textTheme.header2,
                    ),
                    SizedBox(height: 70.h),
                    Text(
                      year,
                      style: context.textTheme.header2,
                    ),
                  ],
                ),
              ),
              orElse: () => SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
