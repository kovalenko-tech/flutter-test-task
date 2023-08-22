import 'package:apptest/feature/result/use_case/use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'result_cubit.freezed.dart';
part 'result_state.dart';

@injectable
class ResultCubit extends Cubit<ResultState> {
  ResultCubit({
    required GetSavedDataUseCase getSavedDataUseCase,
  })  : _getSavedDataUseCase = getSavedDataUseCase,
        super(ResultState.initial());

  final GetSavedDataUseCase _getSavedDataUseCase;

  Future<void> init() async {
    final result = await _getSavedDataUseCase.execute(null);
    emit(_Success(
      option: result.option,
      year: result.year,
    ));
  }
}
