part of 'result_cubit.dart';

@freezed
class ResultState with _$ResultState {
  const factory ResultState.initial() = _Initial;
  const factory ResultState.success({
    required String option,
    required String year,
  }) = _Success;
}
