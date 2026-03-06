import 'package:hive_flutter/hive_flutter.dart';

class HiveStore<T> {
  final String boxName;

  HiveStore(this.boxName);

  Future<Box<T>> _box() async {
    if (!Hive.isBoxOpen(boxName)) {
      return Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

  Future<void> write(String key, T value) async {
    final box = await _box();
    await box.put(key, value);
  }

  Future<T?> read(String key) async {
    final box = await _box();
    return box.get(key);
  }

  Future<void> delete(String key) async {
    final box = await _box();
    await box.delete(key);
  }
}
