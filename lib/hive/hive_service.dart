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

  int get maxExaminationId => box.get('max_examination_id', defaultValue: 0);

  void updateMaxExaminationId(int id) => box.put('max_examination_id', id);

  int get maxRoutineId => box.get('max_routine_id', defaultValue: 0);

  void updateMaxRoutineId(int id) => box.put('max_routine_id', id);

  int get maxTestId => box.get('max_test_id', defaultValue: 0);

  void updateMaxTestId(int id) => box.put('max_test_id', id);

  int get userId => box.get('user_id', defaultValue: 0);

  void updateUserId(int id) => box.put('user_id', id);
}

