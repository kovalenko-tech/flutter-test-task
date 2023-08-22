part of 'choice_cubit.dart';

@freezed
class ChoiceState with _$ChoiceState {
  const factory ChoiceState.initial() = _Initial;
  const factory ChoiceState.success() = _Success;
}
