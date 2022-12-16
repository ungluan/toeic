import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

// import '../data/services/models/user_repository.dart';

String boxName = "settings";

@singleton
class HiveService {
  final Box box;

  HiveService() : box = Hive.box(boxName);

  void updateToken(String token) => box.put('token', token);

  String get token => box.get('token', defaultValue: '');

  bool get hasFingerPrint => box.get('finger_print', defaultValue: false);

  void updateFingerPrint(bool enable) => box.put('finger_print', enable);

  bool get didShowCase => box.get('show_case', defaultValue: false);

  void updateDidShowCase(bool didShow) => box.put('show_case', didShow);
}

