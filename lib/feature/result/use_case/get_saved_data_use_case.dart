import 'dart:async';

import 'package:apptest/common/common.dart';
import 'package:injectable/injectable.dart';
import 'package:use_case/use_case.dart';

class GetSavedDataResult {
  GetSavedDataResult({
    required this.option,
    required this.year,
  });

  final String option;
  final String year;
}

/// Allows to retrieve saved data by the user
@injectable
class GetSavedDataUseCase extends UseCase<GetSavedDataResult> {
  GetSavedDataUseCase({
    required ChooseProvider chooseProvider,
    required DateOfBirthProvider dateOfBirthProvider,
  })  : _chooseProvider = chooseProvider,
        _dateOfBirthProvider = dateOfBirthProvider;

  final ChooseProvider _chooseProvider;
  final DateOfBirthProvider _dateOfBirthProvider;

  @override
  String get id => 'GetSavedDataUseCase';

  @override
  FutureOr<GetSavedDataResult> execute(Object? args) async {
    final option = await _chooseProvider.get();
    final year = await _dateOfBirthProvider.get();

    return GetSavedDataResult(option: option ?? '', year: year ?? '');
  }
}
