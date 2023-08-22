import 'package:apptest/feature/choice/use_case/use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'choice_cubit.freezed.dart';
part 'choice_state.dart';

@injectable
class ChoiceCubit extends Cubit<ChoiceState> {
  ChoiceCubit({
    required SaveChoiceUseCase saveChoiceUseCase,
  })  : _saveChoiceUseCase = saveChoiceUseCase,
        super(ChoiceState.initial());

  final SaveChoiceUseCase _saveChoiceUseCase;

  Future<void> save({
    required String value,
  }) async {
    await _saveChoiceUseCase.execute(value);
    emit(const _Success());
  }
}
