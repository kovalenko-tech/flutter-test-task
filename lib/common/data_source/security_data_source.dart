import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

const _kOptions = IOSOptions(accessibility: KeychainAccessibility.unlocked);

@injectable
class SecurityDataSource {
  SecurityDataSource({
    required FlutterSecureStorage flutterSecureStorage,
  }) : _flutterSecureStorage = flutterSecureStorage;

  final FlutterSecureStorage _flutterSecureStorage;

  Future<void> write({
    required String key,
    required String value,
  }) =>
      _flutterSecureStorage.write(key: key, value: value, iOptions: _kOptions);

  Future<String?> read({
    required String key,
  }) =>
      _flutterSecureStorage.read(key: key, iOptions: _kOptions);

  Future<void> delete({
    required String key,
  }) =>
      _flutterSecureStorage.delete(key: key, iOptions: _kOptions);
}
