import 'package:apptest/common/data_source/data_source.dart';
import 'package:injectable/injectable.dart';

const _kDateOfBirth = 'date_of_birth';

@injectable
class DateOfBirthProvider {
  DateOfBirthProvider({
    required SecurityDataSource securityDataSource,
  }) : _securityDataSource = securityDataSource;

  final SecurityDataSource _securityDataSource;

  Future<String?> get() => _securityDataSource.read(key: _kDateOfBirth);

  Future<void> save({
    required String value,
  }) =>
      _securityDataSource.write(key: _kDateOfBirth, value: value);
}
