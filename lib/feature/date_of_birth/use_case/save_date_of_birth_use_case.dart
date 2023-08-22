import 'dart:async';

import 'package:apptest/common/common.dart';
import 'package:injectable/injectable.dart';
import 'package:use_case/use_case.dart';

/// Allows to save date of birth
@injectable
class SaveDateOfBirthUseCase extends UseCase<void> {
  SaveDateOfBirthUseCase({
    required DateOfBirthProvider dateOfBirthProvider,
  }) : _dateOfBirthProvider = dateOfBirthProvider;

  final DateOfBirthProvider _dateOfBirthProvider;

  @override
  String get id => 'SaveDateOfBirthUseCase';

  @override
  FutureOr<void> execute(int value) async {
    return _dateOfBirthProvider.save(value: value.toString());
  }
}
