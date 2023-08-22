import 'package:apptest/feature/date_of_birth/use_case/use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'date_of_birth_cubit.freezed.dart';
part 'date_of_birth_state.dart';

@injectable
class DateOfBirthCubit extends Cubit<DateOfBirthState> {
  DateOfBirthCubit({
    required SaveDateOfBirthUseCase saveDateOfBirthUseCase,
  })  : _saveDateOfBirthUseCase = saveDateOfBirthUseCase,
        super(DateOfBirthState.initial());

  final SaveDateOfBirthUseCase _saveDateOfBirthUseCase;

  Future<void> save({
    required int year,
  }) async {
    await _saveDateOfBirthUseCase.execute(year);
    emit(const _Success());
  }
}
