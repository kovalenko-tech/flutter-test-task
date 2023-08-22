import 'package:apptest/common/data_source/data_source.dart';
import 'package:injectable/injectable.dart';

const _kChoice = 'choice';

@injectable
class ChooseProvider {
  ChooseProvider({
    required SecurityDataSource securityDataSource,
  }) : _securityDataSource = securityDataSource;

  final SecurityDataSource _securityDataSource;

  Future<String?> get() => _securityDataSource.read(key: _kChoice);

  Future<void> save({
    required String value,
  }) =>
      _securityDataSource.write(key: _kChoice, value: value);
}
