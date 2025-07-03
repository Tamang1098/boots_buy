

import 'package:boots_buy/app/constant/hive_table_constant.dart';
import 'package:boots_buy/features/auth/data/model/user_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}/boots_buy';
    Hive.init(path);

    Hive.registerAdapter(UserHiveModelAdapter());
  }

  Future<void> register(UserHiveModel user) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.UserBox);
    await box.put(user.userId, user);
  }

  Future<void> deleteUser(String id) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.UserBox);
    await box.delete(id);
  }

  Future<List<UserHiveModel>> getAllUsers() async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.UserBox);
    return box.values.toList();
  }

  // ✅ FIXED: Login using email instead of username
  Future<UserHiveModel?> login(String email, String password) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.UserBox);
    try {
      final user = box.values.firstWhere(
            (u) => u.email == email && u.password == password,
      );
      return user;
    } catch (_) {
      return null;
    }
  }

  Future<void> clearAll() async {
    await Hive.deleteFromDisk();
    await Hive.deleteBoxFromDisk(HiveTableConstant.UserBox);
  }

  Future<void> close() async {
    await Hive.close();
  }
}
