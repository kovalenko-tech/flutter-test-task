import 'dart:async';

import 'package:apptest/common/common.dart';
import 'package:injectable/injectable.dart';
import 'package:use_case/use_case.dart';

/// Allows to save the answer option when choosing from the list
@injectable
class SaveChoiceUseCase extends UseCase<void> {
  SaveChoiceUseCase({
    required ChooseProvider chooseProvider,
  }) : _chooseProvider = chooseProvider;

  final ChooseProvider _chooseProvider;

  @override
  String get id => 'SaveChoiceUseCase';

  @override
  FutureOr<void> execute(String value) async {
    return _chooseProvider.save(value: value);
  }
}
